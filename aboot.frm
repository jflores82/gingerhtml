VERSION 5.00
Begin VB.Form aboot 
   BackColor       =   &H80000008&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Out by Sixteen, or dead in the scene, together forever..."
   ClientHeight    =   7380
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   6900
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MouseIcon       =   "aboot.frx":0000
   MousePointer    =   99  'Custom
   ScaleHeight     =   7380
   ScaleWidth      =   6900
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      BackColor       =   &H00808080&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3135
      Left            =   120
      Picture         =   "aboot.frx":030A
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   4200
      Width           =   6615
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H80000007&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   3855
      Left            =   4080
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "aboot.frx":18A0
      Top             =   120
      Width           =   2775
   End
   Begin VB.Image Image1 
      Height          =   4065
      Left            =   0
      Picture         =   "aboot.frx":1B00
      Top             =   0
      Width           =   3960
   End
End
Attribute VB_Name = "aboot"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Me.Hide

End Sub
