from django.contrib import admin
from django.utils.translation import ugettext_lazy as _
from django.forms import Textarea
from django.db import models
from feedback.models import Feedback, FeedbackDetails

class FeedbackDetailsInline(admin.TabularInline):
    model = FeedbackDetails
    extra = 0
    formfield_overrides = {
        models.TextField: {'widget': Textarea(attrs={'rows':4, 'cols':40})},
    }

class FeedbackAdmin(admin.ModelAdmin):
    u"""
    Admin para el gestor de Feedbacks
    """
    model = Feedback
    inlines = [FeedbackDetailsInline]
    list_display = ('workflow', 'active', 'created', 'updated')
    list_filter = ('workflow', 'active', 'created', 'updated')
    save_on_top = True

class FeedbackDetailsAdmin(admin.ModelAdmin):
    u"""
    Admin para los detalles del feedback
    """
    model = FeedbackDetails
    list_display = ('feedback', 'user_from_msg', 'user_to_msg', 'status', 'created', 'updated')
    list_filter = ('feedback', 'user_to', 'user_from', 'status', 'created', 'updated')
    save_on_top = True

    def user_to_msg(self, obj):
        if obj.user_to.profile:
            return obj.user_to.profile
        else:
            return obj.user_to.username

    user_to_msg.short_description = _(u'Para')

    def user_from_msg(self, obj):
        return obj.user_from.profile

    user_from_msg.short_description = _(u'De')

admin.site.register(Feedback, FeedbackAdmin)
admin.site.register(FeedbackDetails, FeedbackDetailsAdmin)
