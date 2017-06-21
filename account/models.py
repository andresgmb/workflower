# -*- coding: utf-8 -*-
from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.conf import settings


class Profile(models.Model):
    u"""Modelo del Perfil de usuario
    Attributes
    ----------
    GENDER : List<Tuple>
        Valores posibles para el sexo del usuario, junto con el valor que se
        muestra en pantalla.
    name : CharField
        Primer nombre del usuario.
    middlename : CharField
        Segundo nombre del usuario
    lastname : CharField
        Primer apellido del usuario
    second_lastname : CharField
        Segundo apellido del usuario
    gender : CharField
        Sexo del usuario
    birthday : DateField
        Fecha de nacimiento del usuario
    rut : CharField
        RUT del usuario. Se debe guardar sin puntos ni guiones.
    serie : CharField
        Número de serie o de documento de la cédula de identidad.
    rut_verified : BooleanField
        Si el RUT fue verificado o se presento rut en fisico.
    profile_picture : ImageField
        Imagen de perfil del usuario.
    cellphone : CharField
        Número de celular del usuario.
    sms_code : CharField
        Código de verificación del celular.
    cellphone_verified : BooleanField
        Si el celular del usuario fue exitosamente guardado o no.
    phone : CharField
        Teléfono fijo del usuario.
    user : User
        Objeto usuario al que pertenece este perfil.
    created : DateTimeField
        Fecha y hora en que fue creado el perfil.
    updated : DateTimeField
        Fecha y hora de la última actualización del perfil.

    :Authors:
        - Aaron Domínguez
    """
    GENDER = (('-', 'Seleccione'), ('f', 'Femenino'), ('m', 'Masculino'))

    user = models.OneToOneField(settings.AUTH_USER_MODEL)
    name = models.CharField(_('Name'), max_length=200, default='')
    middlename = models.CharField(_('Middlename'), max_length=200,
                                  null=True, blank=True)
    lastname = models.CharField(_('Lastname'), max_length=200, default='')
    second_lastname = models.CharField(_('SecondLastname'), max_length=200,
                                       blank=True, null=True)
    gender = models.CharField(_('Gender'), choices=GENDER, max_length=1,
                              default='-', null=True, blank=True)
    birthday = models.DateField(_('Birthday'), null=True, blank=True)
    rut = models.CharField(_('RUT'), max_length=20, unique=True, null=True,
                           blank=True,
                           error_messages={'unique': _('Rut debe ser unico')})
    serie = models.CharField(_('Serie'), max_length=120, null=True, blank=True)
    rut_verified = models.BooleanField(_('RUTVerified'), default=False)
    profile_picture = models.ImageField(_('ProfilePicture'),
                                        upload_to='profileimages/%Y', blank=True, null=True)
    cellphone = models.CharField(_('Cellphone'), max_length=50, blank=True,
                                 null=True, default=None)
    sms_code = models.CharField(_('Code'), max_length=10, blank=True,
                                null=True)
    cellphone_verified = models.BooleanField(_('PhoneVerified'), default=False)
    phone = models.CharField(_('Phone'), max_length=50, blank=True, null=True)
    created = models.DateTimeField(_('Created'), auto_now_add=True,
                                   editable=False)
    updated = models.DateTimeField(_('Updated'), auto_now=True)

    class Meta:
        verbose_name = _("Profile")
        verbose_name_plural = _("Perfiles")
        app_label = 'account'

    def __unicode__(self):
        if self.cellphone:
            return self.name + ' ' + self.lastname + ' (' + self.cellphone + ')'
        else:
            return self.name + ' ' + self.lastname
