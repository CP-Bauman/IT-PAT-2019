object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 339
  Width = 323
  object conBridgeDatabase: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=BridgeDatabase.mdb;' +
      'Mode=ReadWrite;Persist Security Info=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 48
    Top = 32
  end
  object tblUsers: TADOTable
    Connection = conBridgeDatabase
    CursorType = ctStatic
    TableName = 'tblUsers'
    Left = 128
    Top = 32
  end
  object tblPlayer: TADOTable
    Connection = conBridgeDatabase
    CursorType = ctStatic
    TableName = 'tblPlayers'
    Left = 176
    Top = 32
  end
  object tblTournament: TADOTable
    Connection = conBridgeDatabase
    CursorType = ctStatic
    TableName = 'tblTournament'
    Left = 224
    Top = 32
  end
  object dsrUsers: TDataSource
    DataSet = tblUsers
    Left = 128
    Top = 88
  end
  object dsrPlayer: TDataSource
    DataSet = tblPlayer
    Left = 176
    Top = 88
  end
  object dsrTournament: TDataSource
    DataSet = tblTournament
    Left = 224
    Top = 88
  end
end
