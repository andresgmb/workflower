# -*- coding: utf-8 -*-
from django.db import models
from django.utils.translation import ugettext_lazy as _

class WorkflowTypes(models.Model):
    u"""Modelo de los tipos de workflows
    Attributes
    ----------
    name: CharField
        String con el nombre del tipo de workflow.
    detail : TextField
        String del detalle de uso del tipo de workflow.
    active : BooleanField
        Si este tipo aún está activo u obsoleto.
    created : DateTimeField
        Fecha y hora en que fue creado.
    updated : DateTimeField
        Fecha y hora de la última actualización.
    :Authors:
        - Aaron Dominguez"""

    name = models.CharField(_('Nombre'), max_length=100)
    detail = models.TextField(_('Descripcion de uso'), null=True, blank=True)
    active = models.BooleanField(_('Activo'), default=True)
    created = models.DateTimeField(_('Created'), auto_now_add=True, editable=False)
    updated = models.DateTimeField(_('Updated'), auto_now=True, editable=False)

    class Meta:
        verbose_name = _("Tipo")
        verbose_name_plural = _("Tipos de workflow")
        app_label = 'workflow'

    def __unicode__(self):
        return self.name

class WorkflowQuestion(models.Model):
    u"""Modelo de la pregunta a realizar en el workflow
    Attributes
    ----------
    name: CharField
        String con el nombre del tipo de workflow.
    active : BooleanField
        Si esta pregunta aún está activa u obsoleto.
    created : DateTimeField
        Fecha y hora en que fue creado.
    updated : DateTimeField
        Fecha y hora de la última actualización.
    :Authors:
        - Aaron Dominguez"""

    name = models.CharField(_('Nombre'), max_length=100)
    active = models.BooleanField(_('Activo'), default=True)
    created = models.DateTimeField(_('Created'), auto_now_add=True, editable=False)
    updated = models.DateTimeField(_('Updated'), auto_now=True, editable=False)

    class Meta:
        verbose_name = _("Pregunta")
        app_label = 'workflow'

    def __unicode__(self):
        return self.name

class Workflow(models.Model):
    u"""Modelo del workflow
    Attributes
    ----------
    name: CharField
        String con el nombre del workflow.
    detail : TextField
        String del detalle de uso del workflow.
    type : WorkflowType
        Objeto WorkflowType al que pertenece el tipo de workflow.
    question : WorkflowQuestion
        Objeto WorkflowQuestion al que pertenece la pregunta del workflow.
    active : BooleanField
        Si esta workflow aún está activo u obsoleto.
    created : DateTimeField
        Fecha y hora en que fue creado.
    updated : DateTimeField
        Fecha y hora de la última actualización.
    :Authors:
        - Aaron Domínguez"""

    name = models.CharField(_('Nombre'), max_length=100)
    detail = models.TextField(_('Descripcion de uso'), null=True, blank=True)
    type = models.ForeignKey(WorkflowTypes, related_name="workflow_type")
    question = models.ForeignKey(WorkflowQuestion, related_name="workflow_question")
    active = models.BooleanField(_('Activo'), default=True)
    created = models.DateTimeField(_('Created'), auto_now_add=True, editable=False)
    updated = models.DateTimeField(_('Updated'), auto_now=True, editable=False)

    class Meta:
        verbose_name = _("Workflow")
        app_label = 'workflow'

    def __unicode__(self):
        return self.name
