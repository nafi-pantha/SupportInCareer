from django.utils.translation import gettext as _
from enumerify.enum import Enum

class DaysChoice(Enum):
    MONDAY = 0
    TUESDAY = 1
    WEDNESDAY = 2
    THURSDAY = 3
    FRIDAY = 4
    SATURDAY = 5
    SUNDAY = 6
