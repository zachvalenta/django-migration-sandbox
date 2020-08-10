from django.db import models

class Todo(models.Model):
    title = models.CharField(max_length=80)
    description = models.TextField()

    def __repr__(self):
        return self.title
