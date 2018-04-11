# -*- coding: utf-8 -*-
"""
Created on Wed Sep 27 20:55:35 2017

@author: Heena
"""
from bottle import run,template,route
"""
game = template.Library()

@game.assignment_tag
def squares():
	squares = 4
	return squares
	
@game.assignment_tag
def points():
	points =  [1,4,5,8,9,12,13,16]
    return points
	
"""

@route("/")
@route("/tubes/")
def tubes():    
	result = [4,1,4,5,8,9,12,13,16]
	return template('tubes.tpl',rows=result)
	
run(host='localhost',port=8080, reloader=True)
    