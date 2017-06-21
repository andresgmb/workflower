from django.contrib import admin
from workflow.models import Workflow, WorkflowTypes, WorkflowQuestion

class WorkflowAdmin(admin.ModelAdmin):
    u"""
    Admin del gestor de los workflow.
    """

    model = Workflow
    list_display = ('name', 'type', 'question', 'active', 'created', 'updated')
    list_filter = ('name', 'type', 'question', 'active', 'created')
    save_on_top = True

class WorkflowQuestionAdmin(admin.ModelAdmin):
    u"""
    Admin del gestor de las preguntas de los workflows.
    """

    model = WorkflowQuestion
    list_display = ('name', 'created', 'updated')
    list_filter = ('name', 'active', 'created')
    save_on_top = True

class WorkflowTypeAdmin(admin.ModelAdmin):
    u"""
    Admin dle gestor de los tipos de workflows.
    """

    model = WorkflowTypes
    list_display = ('name', 'created', 'updated')
    list_filter = ('name', 'created')
    save_on_top = True

admin.site.register(Workflow, WorkflowAdmin)
admin.site.register(WorkflowQuestion, WorkflowQuestionAdmin)
admin.site.register(WorkflowTypes, WorkflowTypeAdmin)
