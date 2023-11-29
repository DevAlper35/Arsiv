# -*- coding: utf-8 -*-
"""

@author: alpermudurlu
"""

import os
import time
import cv2
import numpy as np
import mss
import pandas as pd 
import pyautogui
is_retina = False
def alper(resim):
    with mss.mss() as sct:
        im = sct.grab(sct.monitors[0])
        if is_retina:
            im.thumbnail((round(im.size[0] * 0.5), round(im.size[1] * 0.5)))
        img_rgb = np.array(im)
        img_gray = cv2.cvtColor(img_rgb, cv2.COLOR_BGR2GRAY)
        template = cv2.imread(resim+".PNG", 0) # arraya dönüşüyor
        '''
        df = pd.read_csv('file.csv')
        print(df)
        Array2d_result = df.to_numpy()
        int8 =Array2d_result.astype(np.int8)
        
        template = int8
        '''
        if template is None:
            raise FileNotFoundError('Image file not found: {}'.format("uyaritekyaz.PNG"))
        template.shape[::-1]

        res = cv2.matchTemplate(img_gray, template, cv2.TM_CCOEFF_NORMED)
        min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(res)
        if max_val < 0.8:
            return [-1, -1]
        return max_loc
    
yol = input("Solid Partların bulunduğu klasörü girin")
a = os.listdir(yol)
yeniyol = yol.replace("\\", "/")
for part in a:
    print(part)
    os.system(yeniyol + "/" + part)
    time.sleep(0.7)
    pos = alper("sheetMetal")
    
    if pos[0] != -1:
        pyautogui.click(pos[0]+15,pos[1]+15)
        #pyautogui.press("ENTER")
        print("buldu X:" +  str(pos[0]) + " Y:" + str(pos[1]))
        
    sahtepos = (5,5)   
    pos = alper("ac")
    if pos[0] != -1:
        pyautogui.click(pos[0]+15,pos[1]+15)
        pyautogui.moveTo(sahtepos[0],sahtepos[1])
        time.sleep(0.2)
    pyautogui.keyDown('ctrl')
    pyautogui.press('1')
    pyautogui.keyUp('ctrl')
    pyautogui.keyDown('ctrl')
    pyautogui.press('s')
    pyautogui.keyUp('ctrl')
    pyautogui.keyDown('ctrl')
    pyautogui.press('f4')
    pyautogui.keyUp('ctrl')
    #pyautogui.keyDown('shift')
    #pyautogui.press('s')
        
    
