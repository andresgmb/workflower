# -*- coding: utf-8 -*-
from __future__ import absolute_import

# Configuración Local
CONFIG = {
    'debug': True,
    'local_deploy': True,
    'secret_key': 'tacke4(9nahz49abnpvfe#5=5k*e4gg&7*b=wb3@te8yi8fhr3',
    'environment': 'localhost',
    'default_email': 'andres@destacame.cl',
    'web_host': True,
    'allowed_hosts': ['*'],
    'base_url': 'http://192.168.0.148',
    'field_encryption_key': 'PAbaLt5NNpdAXlkourxh17c0vPxGNgFT7cpzIMct',
    'administration': {
        'admins': (('Andres', 'andres@destacame.cl'),),
        'reports_email': 'andres@destacame.cl',
        'scraper_email': 'andres@destacame.cl',
        'testers': [
            'andres@destacame.cl',
        ],
        'demo_users': ['andres@destacame.cl']
    },
    'databases': {
        'default': {
            'name': 'workflower',
            'user': 'root',
            'password': 'destacame',
            'port': '',
            'host': ''
        }
    },
}
# END Configuración local
