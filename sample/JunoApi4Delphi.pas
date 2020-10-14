unit JunoApi4Delphi;

interface

uses
  JunoApi4Delphi.Interfaces;

var _JunoApi4Delphi : iJunoApi4DelphiManager;

implementation

uses
  JunoApi4DelphiManager;

const
  ClientId = '9z9j1PSbKtKsyL8X';
  ClientSecret = '4?kPz@-qM[p%){1vquVl@R_OV}?VAkgm';
  ResourceToken = '4D7E1D1E2C3EB19A5DC17639BFE3D5F7896A0395AC23FA45FE05EAD58F7CE567';

initialization
  _JunoApi4Delphi := TJunoApi4DelphiManager.New;

  _JunoApi4Delphi
    .Config
    .ClientId(ClientId)
    .ClientSecret(ClientSecret)
    .ResourceToken(ResourceToken)
    .Sandbox;

end.
