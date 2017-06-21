from django.contrib import admin
from django import forms
from django.utils.translation import ugettext_lazy as _
from django.contrib.auth.models import User
from account.models import Profile

admin.site.unregister(User)


class ProfileInline(admin.StackedInline):
    model = Profile
    can_delete = False
    verbose_name_plural = 'Profile'
    fk_name = 'user'
    max_num = 1
    min_num = 1
    extra = 1

class UserAdminForm(forms.ModelForm):

    class Meta:
        model = User
        exclude = ('user_permissions', )

    def clean(self):
        is_superuser = self.cleaned_data.get('is_superuser')
        email = self.cleaned_data.get('email')
        if is_superuser and not email.endswith('@workflow.cl'):
            msg = u'Solo los emails @workflow.cl pueden ser superusuarios.'
            raise forms.ValidationError(msg)
        return self.cleaned_data


class UserAdmin(admin.ModelAdmin):
    """Admin para el gestor de usuarios, se incluye el formulario de perfil."""
    form = UserAdminForm
    inlines = [ProfileInline, ]
    fieldsets = (
        (None, {'fields': ('username', 'password')}),
        (_('Email'), {'fields': ('email',)}),
        (_('Permissions'), {'fields': ('is_active', 'is_staff', 'is_superuser',
                                       'groups')}),
        (_('Dates'), {'fields': ('last_login', 'date_joined')}), )
    list_display = ('email', 'username', 'is_active',
                    'date_joined')
    save_on_top = True

    def save_model(self, request, obj, form, change):
        if change:
            orig_obj = User.objects.get(pk=obj.pk)
            if obj.password != orig_obj.password and request.user.is_superuser:
                obj.set_password(obj.password)
        elif request.user.is_superuser:
            obj.set_password(obj.password)
        obj.save()

admin.site.register(User, UserAdmin)
