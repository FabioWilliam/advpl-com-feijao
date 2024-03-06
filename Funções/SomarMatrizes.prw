User Function SomarMatrizes(matriz1, matriz2)
// Incrível gerado pelo ChatGPT

Local i, j
Local matrizResultado := {}

// Verifica se as matrizes têm o mesmo tamanho
If Len(matriz1) <> Len(matriz2) Or Len(matriz1[1]) <> Len(matriz2[1])
    MsgInfo("As matrizes devem ter o mesmo tamanho")
    Return {}
EndIf

// Inicializa a matriz resultado com o mesmo tamanho das matrizes de entrada
matrizResultado := Protheus.Framework.NewArray( Len(matriz1), Len(matriz1[1]) )

// Loop para somar os elementos correspondentes das duas matrizes
For i := 1 To Len(matriz1)
    For j := 1 To Len(matriz1[1])
        matrizResultado[i][j] := matriz1[i][j] + matriz2[i][j]
    Next j
Next i

Return matrizResultado
