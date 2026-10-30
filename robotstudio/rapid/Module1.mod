MODULE Module1
    CONST robtarget Home:=[[1474.803895533,139.424250096,1665.037125956],[0.459582398,-0.175374288,0.855291917,-0.162799311],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget outputconveyor:=[[-184.281351949,-1229.922398975,1366.756667233],[0.156905018,0.754106451,0.590982536,-0.23967461],[-2,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget piece1:=[[1013.994844068,121.183635284,1360.015530693],[0.357780382,-0.074313208,0.930842174,0.00189521],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget piece2:=[[1435.058993673,173.69155968,1269.844811901],[0.292045527,-0.07708114,0.953292676,-0.000991256],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget piece3:=[[1781.7979977,216.930922199,1327.393460752],[0.361859605,-0.07412697,0.929278487,0.002076568],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !***********************************************************
    !
    ! Module:  Module1
    !
    ! Description:
    !   <Insert description here>
    !
    ! Author:
    !
    ! Version: 1.0
    !
    !***********************************************************
    
    
    !***********************************************************
    !
    ! Procedure main
    !
    !   This is the entry point of your program
    !
    !***********************************************************
    VAR intnum int_stop;  
    CONST robtarget Home1:=[[1474.803895533,139.424250096,1665.037125956],[0.588899737,0.014417368,0.80802482,0.009226527],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget piece1aaaa:=[[1013.994844068,121.183635284,1360.015530693],[0.357780382,-0.074313208,0.930842174,0.00189521],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Piece11:=[[1172.11195973,-9.030466875,831.444297614],[0.002448848,-0.018757061,-0.999462384,-0.026779088],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget OutputConveyor2:=[[-295.047123906,-1291.323271919,679.202642776],[0.002104151,-0.697095515,-0.716974492,0.000996707],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget OutputConveyor1:=[[-294.782718531,-1291.413556612,1228.852045642],[0.002104156,-0.697095493,-0.716974513,0.0009967],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Piece12:=[[1172.111988165,-9.030467255,1024.716025878],[0.002448858,-0.018757059,-0.999462384,-0.026779088],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Piece21:=[[1571.825700375,-23.975586054,829.084434858],[0.002448848,-0.018757061,-0.999462384,-0.026779088],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Piece22:=[[1571.82572883,-23.97558462,1022.35615517],[0.002448858,-0.018757059,-0.999462384,-0.026779088],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Piece31:=[[1951.553753987,-38.173449273,826.842565239],[0.002448848,-0.018757061,-0.999462384,-0.026779088],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Piece32:=[[1951.553782463,-38.173446117,1020.114277997],[0.002448858,-0.018757059,-0.999462384,-0.026779088],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  
    PROC main()
        IDelete int_stop; !It deletes the interruption
        CONNECT int_stop WITH Stop_Robot; !Conects the variable with the trap routine
        iSignalDI diRobot_Halt,1, int_stop; !Conects the digital input with the variable
        Reset doJob1Done;
        Reset doJob2Done;
        Reset doJob3Done;
        MoveJ Home1,v1000,z100,tool0\WObj:=wobj0;
        
        WHILE diRobotAuto_On=1 DO
        WaitDI diRobotAuto_On,1;
        Jobs;
        ENDWHILE
    ENDPROC
    
    PROC Jobs()
        
        IF diPiece1=1 AND diRobot_Halt=0 THEN
            Piece_1;
        ENDIF
        IF diPiece2=1 AND diRobot_Halt=0 THEN
            Piece_2;
        ENDIF
        IF diPiece3=1 AND diRobot_Halt=0 THEN
            Piece_3;
        ENDIF
    ENDPROC
    
    PROC Piece_1()
        
        Reset doJob2Done;
        Reset doJob3Done;
        MoveL Piece12,v500,z0,tool0\WObj:=wobj0;
        MoveL Piece11,v500,z0,tool0\WObj:=wobj0;
        WaitTime 1;
        Reset doToolOFF;
        Set doToolON;
        MoveL Piece12,v500,z0,tool0\WObj:=wobj0;
        MoveL OutputConveyor1,v500,z0,tool0\WObj:=wobj0;
        MoveL OutputConveyor2,v500,z0,tool0\WObj:=wobj0;
        Set doJob1Done;
        Reset doToolON;
        WaitTime 1;
        Set doToolOFF;
        MoveL OutputConveyor1,v500,z0,tool0\WObj:=wobj0;
        
 
    ENDPROC
    
    PROC Piece_2()
        
        Reset doJob1Done;
        Reset doJob3Done;
        MoveL Piece22,v500,z0,tool0\WObj:=wobj0;
        MoveL Piece21,v500,z0,tool0\WObj:=wobj0;
        WaitTime 1;
        Reset doToolOFF;
        Set doToolON;
        MoveL Piece22,v500,z0,tool0\WObj:=wobj0;
        MoveL OutputConveyor1,v500,z0,tool0\WObj:=wobj0;
        MoveL OutputConveyor2,v500,z0,tool0\WObj:=wobj0;
        Set doJob2Done;
        Reset doToolON;
        WaitTime 1;
        Set doToolOFF;
        MoveL OutputConveyor1,v500,z100,tool0\WObj:=wobj0;

    ENDPROC
    
    PROC Piece_3()

        Reset doJob2Done;
        Reset doJob1Done;
        MoveL Piece32,v500,z0,tool0\WObj:=wobj0;
        MoveL Piece31,v500,z0,tool0\WObj:=wobj0;
        WaitTime 1;
        Set doToolON;
        Reset doToolOFF;
        MoveL Piece32,v500,z0,tool0\WObj:=wobj0;
        MoveL OutputConveyor1,v500,z0,tool0\WObj:=wobj0;
        MoveL OutputConveyor2,v500,z0,tool0\WObj:=wobj0;
        Set doJob3Done;
        Reset doToolON;
        WaitTime 1;
        Set doToolOFF;
        MoveL OutputConveyor1,v500,z0,tool0\WObj:=wobj0;
    ENDPROC
    
    TRAP Stop_Robot
        StopMove; 
        WaitDi diRobot_Halt,0;
        StartMove;
    ENDTRAP
        
	
ENDMODULE