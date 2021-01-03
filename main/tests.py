from django.test import TestCase
from .models import *
# Create your tests here.
class AboutTestCase(TestCase):
    def setUp(self):
        About.objects.create(title='about-test',description='about-test')

    def test_About_is_ok(self):
        AboutTestCase=About.objects.get(title='about-test')
        self.assertEqual(AboutTestCase.title(),'yes title it work')

