unit AuthorizationToken;

interface

type
    TAuthorizationToken = class
    private
    Faccess_token: String;
    Ftoken_type: String;
    Fscope: String;
    Fexpires_in: Integer;
    Fuser_name: String;
    Fjti: String;
    public
      property access_token : String read Faccess_token write Faccess_token;
      property token_type : String read Ftoken_type write Ftoken_type;
      property expires_in : Integer read Fexpires_in write Fexpires_in;
      property scope : String read Fscope write Fscope;
      property user_name : String read Fuser_name write Fuser_name;
      property jti : String read Fjti write Fjti;
  end;

implementation

end.
