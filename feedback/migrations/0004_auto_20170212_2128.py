# -*- coding: utf-8 -*-
# Generated by Django 1.9.11 on 2017-02-12 21:28
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('feedback', '0003_auto_20170212_1915'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='feedbackdetails',
            name='comment_comp',
        ),
        migrations.RemoveField(
            model_name='feedbackdetails',
            name='comment_user',
        ),
        migrations.AddField(
            model_name='feedbackdetails',
            name='comment_from',
            field=models.TextField(blank=True, null=True, verbose_name='Comentario de emisor'),
        ),
        migrations.AddField(
            model_name='feedbackdetails',
            name='comment_to',
            field=models.TextField(blank=True, null=True, verbose_name='Comentario de receptor'),
        ),
    ]
