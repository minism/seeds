""" Copyright 2011 Josh Bothun <joshbothun@gmail.com> """

VERSION = (0, 0, 1)

# Python
import sys

# PyQt
from PyQt4.QtCore import *
from PyQt4.QtGui import *

class MainWindow(QMainWindow):
    """ Main window class """

    def __init__(self):
        # Super
        QMainWindow.__init__(self)

def main():
    # Create Qt Application
    app = QApplication(sys.argv)
    
    # Create main window
    window = MainWindow()
    
    # Run application
    window.show()
    window.raise_()
    sys.exit(app.exec_())
