from django.db import models

# Create your models here.
class Company(models.Model):
    id = models.AutoField(primary_key=True)  # オートインクリメントなid
    name = models.CharField(max_length=100)  # 企業名フィールド

    def __str__(self):
        return self.name


class User(models.Model):
    id = models.AutoField(primary_key=True)  # オートインクリメントなid
    name = models.CharField(max_length=100)  # nameフィールド
    password = models.CharField(max_length=100)  # passwordフィールド
    company_id = models.ForeignKey(Company, on_delete=models.CASCADE, related_name='users')  # company_idを保持

    def __str__(self):
        return self.name
