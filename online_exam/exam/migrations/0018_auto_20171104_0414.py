# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-11-03 22:14
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('exam', '0017_auto_20171104_0020'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='essayquestion',
            name='test_id',
        ),
        migrations.RemoveField(
            model_name='mcqquestion',
            name='test_id',
        ),
        migrations.RemoveField(
            model_name='test',
            name='subject_id',
        ),
        migrations.DeleteModel(
            name='EssayQuestion',
        ),
        migrations.DeleteModel(
            name='McqQuestion',
        ),
        migrations.DeleteModel(
            name='Subject',
        ),
        migrations.DeleteModel(
            name='Test',
        ),
    ]
