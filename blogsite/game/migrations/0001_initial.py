# Generated by Django 2.2.8 on 2021-11-26 07:32

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='cg_mp700_produce',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('warehouse', models.CharField(max_length=45)),
                ('main_chef', models.CharField(max_length=45)),
            ],
        ),
        migrations.CreateModel(
            name='cg_mp700_detail',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('round', models.IntegerField()),
                ('step', models.IntegerField()),
                ('start_dttm', models.DateTimeField()),
                ('end_dttm', models.DateTimeField(null=True)),
                ('produce', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='produce_detail', to='game.cg_mp700_produce')),
            ],
        ),
    ]
