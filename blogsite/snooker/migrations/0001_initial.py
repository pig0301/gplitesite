from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='campaign',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('event_dt', models.DateField()),
                ('gym_id', models.IntegerField()),
                ('cue_id', models.IntegerField()),
                ('opponent_id', models.IntegerField()),
                ('let_points', models.IntegerField()),
                ('is_finished', models.CharField(max_length=1)),
            ],
        ),
        migrations.CreateModel(
            name='cue',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=45)),
                ('material', models.CharField(max_length=45)),
                ('owner_id', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='frame',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('campaign_id', models.IntegerField()),
                ('cue_id', models.IntegerField()),
                ('let_points', models.IntegerField()),
                ('get_points', models.IntegerField()),
                ('oppo_points', models.IntegerField()),
                ('is_win', models.CharField(max_length=1)),
                ('max_break', models.IntegerField(null=True)),
                ('memo', models.CharField(max_length=200, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='group',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=45)),
                ('is_show', models.CharField(max_length=1)),
            ],
        ),
        migrations.CreateModel(
            name='gym',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=45)),
                ('road', models.CharField(max_length=45)),
            ],
        ),
        migrations.CreateModel(
            name='player',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=45)),
                ('group_id', models.IntegerField()),
            ],
        ),
    ]
