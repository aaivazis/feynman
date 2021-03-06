#!/usr/bin/env python3
#
# Alec Aivazis <alec@aivazis.com>
# 
# (c) 2014-2015 all rights reserved
#

# main
if __name__ == "__main__":
    # externals
    import os
    import sys
    # point django to the project settings
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "feynman.settings.local")
    # pull the shell
    import django.core.management
    # and invoke it
    django.core.management.execute_from_command_line(sys.argv)

# end of file
