# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-11-02 22:09
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('exam', '0011_auto_20171103_0400'),
    ]

    operations = [
        migrations.AlterField(
            model_name='mcqanswer',
            name='test_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='exam.Test'),
        ),
        migrations.AlterUniqueTogether(
            name='mcqanswer',
            unique_together=set([('user_id', 'test_id')]),
        ),
    ]