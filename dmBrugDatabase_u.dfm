object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 339
  Width = 323
  object conBridgeDatabase: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=H:\IT PAT 2019\Brid' +
      'geDatabase.mdb;Mode=ReadWrite;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 48
    Top = 32
  end
  object tblUsers: TADOTable
    Active = True
    Connection = conBridgeDatabase
    CursorType = ctStatic
    TableName = 'tblUsers'
    Left = 128
    Top = 32
  end
  object tblPlayer: TADOTable
    Active = True
    Connection = conBridgeDatabase
    CursorType = ctStatic
    TableName = 'tblPlayers'
    Left = 176
    Top = 32
  end
  object tblTournament: TADOTable
    Active = True
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