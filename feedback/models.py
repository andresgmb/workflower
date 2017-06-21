# -*- coding: utf-8 -*-
from django.utils.translation import ugettext_lazy as _
from django.db import models
from django.conf import settings
from workflow.models import Workflow

class Feedback(models.Model):
    u"""Modelo del feedback
    Attributes
    ----------
    workflow : Workflow
        Objeto workflow al que pertenece este feedback.
    active : BooleanField
        Si este feedback aún está activo u obsoleto.
    created : DateTimeField
        Fecha y hora en que fue creado.
    updated : DateTimeField
        Fecha y hora de la última actualización.
    :Authors:
        - Aaron Domínguez"""
        
    workflow = models.ForeignKey(Workflow, related_name="workflow")
    active = models.BooleanField(_('Activo'), default=True)
    created = models.DateTimeField(_('Created'), auto_now_add=True, editable=False)
    updated = models.DateTimeField(_('Updated'), auto_now=True, editable=False)

    class Meta:
        verbose_name = _('feedback')
        app_label = 'feedback'

    def __unicode__(self):
        return self.workflow.name


class FeedbackDetails(models.Model):
    u"""Modelo del la instancia de un feedback
    Attributes
    ----------
    STATUS : List<Tuple>
        Valores posibles para el status del feedback, junto con el valor que se
        muestra en pantalla.
    feedback : Feedback
        Objeto feedback al que pertenece este detalle.
    user_to : User
        Objeto User al que pertenece quien recibe el detalle del feedback.
    user_from : User
        Objeto User al que pertenece quien envia el detalle del feedback.
    comment_from : TextField
        String de comentario perteneciente al emisor del feedback.
    comment_to : TextField
        String de comentario perteneciente al receptor del feedback.
    created : DateTimeField
        Fecha y hora en que fue creado.
    updated : DateTimeField
        Fecha y hora de la última actualización.
    :Authors:
        - Aaron Domínguez"""

    STATUS_PENDING = 1
    STATUS_READ = 2
    STATUS_NO_ANSWER = 3
    STATUS_CLOSED = 4
    STATUS = (
        (STATUS_PENDING, u'Pendiente'),
        (STATUS_READ, u'Leido'),
        (STATUS_NO_ANSWER, u'Sin atención'),
        (STATUS_CLOSED, u'Respondido'),
    )
    feedback = models.ForeignKey(Feedback, related_name="feedback_detail")
    user_to = models.ForeignKey(settings.AUTH_USER_MODEL, related_name="fb_user_to")
    user_from = models.ForeignKey(settings.AUTH_USER_MODEL, related_name="fb_user_from")
    status = models.IntegerField(_('Status'), choices=STATUS, default=1)
    comment_from = models.TextField(_('Comentario de emisor'), null=True, blank=True)
    comment_to = models.TextField(_('Comentario de receptor'), null=True, blank=True)
    created = models.DateTimeField(_('Created'), auto_now_add=True, editable=False)
    updated = models.DateTimeField(_('Updated'), auto_now=True, editable=False)

    class Meta:
        verbose_name = _("detail")
        verbose_name_plural = _("Listado de feedbacks")
        app_label = 'feedback'

    def __unicode__(self):
        return self.feedback.workflow.name
