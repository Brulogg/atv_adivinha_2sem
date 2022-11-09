@echo off
title ADIVINHA
mode 60, 35
color 0a
set /p nome=DIGITE SEU NOME PARA INICIAR:
goto:randomizar

:randomizar
    set /a numero=(%random% %% 50) + 1
    goto:inicio

:inicio
set /a tentativa=5
cls
echo ===========================================================
echo                     MENU ADIVINHA 1-50
echo ===========================================================
echo Ola, %nome%
echo Voce tera que adivinhar um numero entre 1 e 50
echo Voce possui %tentativa% tentativas!
echo ===========================================================
set /p ini=Deseja iniciar?[s/n]:
if /i %ini% == s (goto:jogo)
if /i %ini% == n (exit) else (
    echo.
    echo ------------------------------------
    echo           Opcao invalida!
    echo ------------------------------------
    pause > nul
    goto:inicio)    
)

:jogo2
cls
echo ===========================================================
echo                     MENU ADIVINHA 1-50
echo ===========================================================
echo Ola, %nome%
echo Voce tera que adivinhar um numero entre 1 e 50
echo Voce possui %tentativa% tentativas!
echo ===========================================================
echo.
goto:jogo

:jogo
echo ===========================================================
echo              DIGITE UM NUMERO DE 1 A 50
echo ===========================================================
set /p tent=Numero:

if %tent% LEQ 0 (
    echo ------------------------------------
    echo    DIGITE UM NUMERO ENTRE 1 E 50
    echo ------------------------------------
    pause > nul
    goto:jogo2
)
if %tent% gtr 50 (
    echo.
    echo ------------------------------------
    echo    DIGITE UM NUMERO ENTRE 1 E 50
    echo ------------------------------------
    pause > nul
    goto:jogo2
)
if %tent% equ %numero% (
    echo ===========================================================
    echo              PARABENS, VOCE ACERTOU!!
    echo              O NUMERO SORTEADO ERA %numero%
    echo ===========================================================
    pause > nul
    goto:novamente
)
if %tent% neq %numero% (
    if %tent% lss %numero% (
        set /a tentativa= %tentativa% - 1
        if %tentativa% == 1 (
            echo.
            echo ===========================================================
            echo                      VOCE PERDEU!!!
            echo                      O NUMERO ERA %numero%
            echo ===========================================================
            goto:novamente
        )
        echo.
        echo ===========================================================
        echo                      VOCE ERROU!!!
        echo                  TENTE UM NUMERO MAIOR
        echo ===========================================================
        pause > nul
        goto:jogo2
    )
    if %tent% gtr %numero% (
        set /a tentativa= %tentativa% - 1
        if %tentativa% == 1 (
            echo.
            echo ===========================================================
            echo                      VOCE PERDEU!!!
            echo                      O NUMERO ERA %numero%
            echo ===========================================================
            goto:novamente
        )
        echo.
        echo ===========================================================
        echo                      VOCE ERROU!!!
        echo                  TENTE UM NUMERO MENOR
        echo ===========================================================
        pause > nul
        goto:jogo2
    )
)
:novamente
    set /p dnv=Deseja jogar novamente?[S/N]:
    if /i %dnv% == s (goto:randomizar)
    if /i %dnv% == n (exit) else (
        echo.
        echo ------------------------------------
        echo           Opcao invalida!
        echo ------------------------------------
        pause > nul
        goto:novamente
    )