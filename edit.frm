VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form edit 
   Caption         =   "Ginger Html - [Sem Documento]"
   ClientHeight    =   5355
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   7590
   Icon            =   "edit.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MouseIcon       =   "edit.frx":030A
   MousePointer    =   99  'Custom
   ScaleHeight     =   5355
   ScaleWidth      =   7590
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog Common1 
      Left            =   240
      Top             =   480
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      Filter          =   $"edit.frx":0614
   End
   Begin RichTextLib.RichTextBox editor 
      Height          =   4935
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   7095
      _ExtentX        =   12515
      _ExtentY        =   8705
      _Version        =   393217
      BackColor       =   12632256
      Enabled         =   -1  'True
      ScrollBars      =   2
      TextRTF         =   $"edit.frx":06A1
      MouseIcon       =   "edit.frx":076A
   End
   Begin VB.Image Image1 
      Height          =   5385
      Left            =   0
      Picture         =   "edit.frx":0A84
      Top             =   0
      Width           =   8055
   End
   Begin VB.Menu mnu_principal 
      Caption         =   "&Principal"
      Begin VB.Menu mnu_novo 
         Caption         =   "&Novo"
      End
      Begin VB.Menu mnu_sep3 
         Caption         =   "-"
      End
      Begin VB.Menu mnu_abrir 
         Caption         =   "&Abrir"
         Shortcut        =   ^A
      End
      Begin VB.Menu mnu_salvar 
         Caption         =   "&Salvar"
         Shortcut        =   ^S
      End
      Begin VB.Menu mnu_salvab 
         Caption         =   "Salvar + Abrir"
         Shortcut        =   {F12}
      End
      Begin VB.Menu mnu_fechar 
         Caption         =   "&Fechar"
         Shortcut        =   ^W
      End
      Begin VB.Menu mnu_sep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnu_sair 
         Caption         =   "&Sair"
         Shortcut        =   ^R
      End
   End
   Begin VB.Menu mnu_editar 
      Caption         =   "Editar"
      Visible         =   0   'False
      Begin VB.Menu mnu_copy 
         Caption         =   "Copiar"
         Shortcut        =   ^C
      End
      Begin VB.Menu mnu_colar 
         Caption         =   "Colar"
         Shortcut        =   ^V
      End
      Begin VB.Menu mnu_sep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnu_opcoes 
         Caption         =   "Opções..."
         Visible         =   0   'False
      End
   End
   Begin VB.Menu mnu_formatar 
      Caption         =   "Formatar"
      Visible         =   0   'False
      Begin VB.Menu mnu_fonte 
         Caption         =   "Fonte..."
      End
      Begin VB.Menu mnu_alinhamento 
         Caption         =   "Alinhamento"
         Begin VB.Menu mnu_esquerda 
            Caption         =   "Esquerda"
         End
         Begin VB.Menu mnu_direita 
            Caption         =   "Direita"
         End
         Begin VB.Menu mnu_center 
            Caption         =   "Centralizado"
         End
      End
   End
   Begin VB.Menu mnu_ajuda1 
      Caption         =   "&Ajuda"
      Begin VB.Menu mnu_ajuda 
         Caption         =   "Ajuda"
         Enabled         =   0   'False
         Visible         =   0   'False
      End
      Begin VB.Menu mnu_sobre 
         Caption         =   "Sobre..."
         Shortcut        =   {F1}
      End
   End
End
Attribute VB_Name = "edit"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'/***********************************************\
'/         Código Fonte - GingerHtml.            \
'/              Coded by Ti-B0ne                 \
'/                 Gingerware                    \
'/***********************************************\

Dim texto$
Dim mudanca$
Public Sobre$
Public build$
Dim merda$
Dim haha$
Dim hoho
Public iex$
Public cmdline As String
Dim fheight As Integer
Dim fwidth As Integer

Private Sub Form_KeyPress(KeyAscii As Integer)

edit.Tag = "1"

End Sub

Private Sub Form_Load()
    declarations
      
    'editor.SelColor = QBColor(10)
            
    fheight = edit.Height
    fwidth = edit.Width
                
    cmdline = Command()
        
    If cmdline = "" Or cmdline = " " Or cmdline = "     " Then
        
    editor.Visible = False
    mnu_salvar.Enabled = False
    mnu_fechar.Enabled = False
    mnu_copy.Enabled = False
    mnu_colar.Enabled = False
    mnu_formatar.Enabled = False
    mnu_opcoes.Enabled = False
        
    End If
    
    If cmdline <> "" Or cmdline <> " " Then
    
      
       If cmdline = "" Or cmdline = " " Or cmdline = "     " Then
         
       editor.Visible = False
       mnu_salvar.Enabled = False
       mnu_fechar.Enabled = False
       mnu_copy.Enabled = False
       mnu_colar.Enabled = False
       mnu_formatar.Enabled = False
       mnu_opcoes.Enabled = False
       Exit Sub
       
    End If
          
      editor.Visible = True
      edit.Tag = "0"
      editor.LoadFile cmdline
      mnu_salvar.Enabled = True
      mnu_fechar.Enabled = True
      edit.Caption = "Ginger Html - [ " + cmdline + " ]"
      Exit Sub
    End If
        
End Sub

Private Sub Form_Resize()

If Me.WindowState = 1 Then Exit Sub

edit.Height = fheight
edit.Width = fwidth


End Sub

Private Sub Form_Unload(Cancel As Integer)

mnu_sair_Click

End Sub

Private Sub mnu_abrir_Click()
    edit.Tag = "0"
    editor.Visible = True
        Common1.ShowOpen
        editor.Text = " "
        editor.LoadFile Common1.FileName
        edit.Caption = "Ginger Html - [" + Common1.FileName + "]"
    mnu_salvar.Enabled = True
    mnu_fechar.Enabled = True
    mnu_copy.Enabled = True
    mnu_colar.Enabled = True
    mnu_formatar.Enabled = True
           
End Sub

Private Sub mnu_novo_Click()
    
    If edit.Tag = "1" Then
        MsgBox "O Arquivo Ainda não foi salvo, deseja salva-lo?", vbYesNoCancel, "Pergunta"
        If vbYes = True Then
            Common1.ShowSave
            editor.SaveFile Common1.FileName, rtffile
        End If
     End If
     If vbYes = False Or edit.Tag = "0" Then
            editor.Visible = True
            editor.Text = " "
            mnu_salvar.Enabled = True
            mnu_fechar.Enabled = True
            mnu_copy.Enabled = True
            mnu_colar.Enabled = True
            mnu_formatar.Enabled = True
            edit.Caption = "Ginger Html - [Novo Documento]"
            edit.Tag = 0
             
        End If
    
    editor.Visible = True
    editor.Text = " "
    mnu_salvar.Enabled = True
    mnu_fechar.Enabled = True
    mnu_copy.Enabled = True
    mnu_colar.Enabled = True
    mnu_formatar.Enabled = True
    edit.Caption = "Ginger Html - [Novo Documento]"
    edit.Tag = 0
            
    
End Sub

Private Sub mnu_sair_Click()

mnu_fechar_Click

End

End Sub

Private Sub mnu_salvab_Click()

    Common1.ShowSave
    editor.SaveFile Common1.FileName, 1
    edit.Caption = "Ginger Html - [" + Common1.FileName + "]"
    edit.Tag = "0"
    
    iex$ = "c:\arquiv~1\intern~1\iexplore.exe " + Common1.FileName
    Shell iex$, vbMaximizedFocus
    
    
    
End Sub

Private Sub mnu_salvar_Click()
    
    Common1.ShowSave
    editor.SaveFile Common1.FileName, 1
    edit.Caption = "Ginger Html - [" + Common1.FileName + "]"
    edit.Tag = "0"
    
End Sub

Private Sub mnu_fechar_Click()
        
    If edit.Tag = "1" Then
        merda$ = "O Arquivo Ainda não foi salvo, deseja salvár-lo?"
        haha$ = vbYesNoCancel + vbQuestion
        hoho = MsgBox(merda$, haha$, "Pergunta")
    End If
    
    If hoho = vbYes Then
            Common1.ShowSave
            editor.SaveFile Common1.FileName, rtfText
    End If
    If hoho = vbNo Then
            editor.Visible = False
            edit.Caption = "Ginger Html - [Sem Titulo]"
            editor.Tag = "0"
    End If
                 
    If edit.Tag = "0" Then
            End If
            
     
          
    editor.Text = " "
    editor.Visible = False
    edit.Caption = "Ginger Html - [Sem Titulo]"
    mnu_salvar.Enabled = False
    mnu_fechar.Enabled = False
    mnu_copy.Enabled = False
    mnu_colar.Enabled = False
    mnu_formatar.Enabled = False
    mnu_opcoes.Enabled = False
       
End Sub

Private Sub mnu_sobre_Click()

aboot.Show

End Sub
