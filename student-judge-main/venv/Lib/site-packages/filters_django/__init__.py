# coding=utf-8
from __future__ import absolute_import, division, print_function, \
  unicode_literals

from typing import Mapping, Sequence, Text, Type, Union

from django.db.models import Model as DjangoModel
from django.db.models.query import QuerySet
from filters import BaseFilter
from six import iteritems, python_2_unicode_compatible

__all__ = [
  'Model',
]


@python_2_unicode_compatible
class Model(BaseFilter):
  """
  Expects the value to correspond to a record in the database.
  """
  CODE_NOT_FOUND = 'not_found'
  CODE_NOT_UNIQUE = 'not_unique'

  templates = {
    CODE_NOT_FOUND:
      'This value does not match any {model} records.',

    CODE_NOT_UNIQUE:
      'This value matches too many {model} records.',
  }

  def __init__(self, model, field='pk', **predicates):
    # type: (Type[DjangoModel], Text, **Union[Mapping, Sequence]) -> None
    """
    :param model:
      The model that will be queried.
    
    :param field:
      The field that the incoming value will be matched against.

    :param predicates:
      Additional QuerySet methods to invoke to further limit/customize
      the filter result.
      
      Note: the result from calling each predicate MUST be a
      :py:class:`QuerySet`, or else an exception will be raised at
      runtime (e.g., ``count`` is not a valid predicate).
      
      IMPORTANT: If you specify a predicate that executes a write
      query (e.g., ``update`` or ``delete``), the filter will still
      raise an exception... but not before executing the query!
      
      Example::
      
         f.ext.Model(
           # Find a Post record with a ``slug`` that matches the input.
           model = Post,
           field = 'slug',

           # Predicates
           filter={'published': True},
           exclude={'comments__isnull': True'},           
           select_related=('author', 'comments'),
         )
    """
    super(Model, self).__init__()

    self.model = model
    self.field = field
    self.predicates = predicates

  def __str__(self):
    return '{type}({model!r}, field={field!r})'.format(
      type = type(self).__name__,
      model = self.model,
      field = self.field,
    )

  def _apply(self, value):
    query_set = self.model.objects.filter(**{self.field: value})

    for name, args in iteritems(self.predicates):
      predicate = getattr(query_set, name)

      query_set = (
        predicate(**args)
          if isinstance(args, Mapping)
          else predicate(*args)
      )

      if not isinstance(query_set, QuerySet):
        raise ValueError(
          'Invalid result from predicate "{predicate}" '
          '(expected QuerySet, actual {actual}).'.format(
            actual    = type(query_set).__name__,
            predicate = name,
          ),
        )

    try:
      return query_set.get(**{self.field: value})
    except self.model.DoesNotExist:
      return self._invalid_value(
        exc_info  = True,
        reason    = self.CODE_NOT_FOUND,
        value     = value,

        template_vars = {
          'field': self.field,
          'model': self.model.__name__,
        },
      )
    except self.model.MultipleObjectsReturned:
      return self._invalid_value(
        value     = value,
        reason    = self.CODE_NOT_UNIQUE,
        exc_info  = True,

        template_vars = {
          'field': self.field,
          'model': self.model.__name__,
        },
      )
