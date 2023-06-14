unit DTConsultValid;

interface

uses
  System.SysUtils, System.Classes,System.Net.HttpClient,
  System.Generics.Collections,Json;

type TpvRegimeTributario = (tpvSimplesNacional,tpvLucroPresumido,tpvLucroReal);
type TAmbiente = (tpvHomologacao,tpvProducao);
type TArquivo = (tpvEnvio,tpbRetorno);

type Tretorno = record
  Codigo   : integer;
  Mensagem : string;
end;

const
 URL_Homologacao = 'http://consultthis.com.br/ws/WSDLj.php';
 URL_Producao    = 'http://consultthis.com.br/ws/WSDLj.php';

type TErros = class
      COD_INTERNO : string;
      DESCRICAO   : string;
      MSGERR      : string;
end;

type TResumo = class
     TOTAL          : string;
     CERTOS         : string;
     AJUSTADO       : string;
     ANALISECLIENTE : string;
     ANALISECONSULT : string;
end;

type TAjustados = class
  private
    FCSTCOF_S: String;
    FCST_ICMS_S: String;
    FALIQREDICMS: String;
    FLISTA: String;
    FAliq_ICMS: String;
    FDESCRICAO: String;
    FMVA: String;
    FTIP_MED: String;
    FNATRECEITA: String;
    FMOT_DES: String;
    FCST_IPI: String;
    FCOD_BARRAS: String;
    FCFOP: string;
    FPRED_ALIQICMS: String;
    FCSTPIS_E: String;
    FALIQ_PIS: String;
    FALIQ_COFINS: String;
    FPICMSST: String;
    FCSTCOF_E: String;
    FCOD_CEST: String;
    FPMvast: String;
    FMOD_BC: String;
    FALIQ_DESICMS: String;
    FFEM_ICMS: String;
    FCST_ICMS_E: String;
    FCOD_INTERNO: String;
    FENQ_IPI: String;
    FCST_CSOSN_S: String;
    FCSTPIS_S: String;
    FAliq_IPI: String;
    FTP_ALIQICMS: String;
    FCOD_NCM: String;
    FCOD_BENEF: String;
  published
  property ALIQREDICMS     : String           read FALIQREDICMS     write FALIQREDICMS    ;
  property ALIQ_COFINS     : String           read FALIQ_COFINS     write FALIQ_COFINS    ;
  property ALIQ_DESICMS    : String           read FALIQ_DESICMS    write FALIQ_DESICMS   ;
  property ALIQ_PIS        : String           read FALIQ_PIS        write FALIQ_PIS       ;
  property Aliq_ICMS       : String           read FAliq_ICMS       write FAliq_ICMS      ;
  property Aliq_IPI        : String           read FAliq_IPI        write FAliq_IPI       ;
  property CFOP            : string           read FCFOP            write FCFOP           ;
  property COD_BARRAS      : String           read FCOD_BARRAS      write FCOD_BARRAS     ;
  property COD_BENEF       : String           read FCOD_BENEF       write FCOD_BENEF      ;
  property COD_CEST        : String           read FCOD_CEST        write FCOD_CEST       ;
  property COD_INTERNO     : String           read FCOD_INTERNO     write FCOD_INTERNO    ;
  property COD_NCM         : String           read FCOD_NCM         write FCOD_NCM        ;
  property CSTCOF_E        : String           read FCSTCOF_E        write FCSTCOF_E       ;
  property CSTCOF_S        : String           read FCSTCOF_S        write FCSTCOF_S       ;
  property CSTPIS_E        : String           read FCSTPIS_E        write FCSTPIS_E       ;
  property CSTPIS_S        : String           read FCSTPIS_S        write FCSTPIS_S       ;
  property CST_CSOSN_S     : String           read FCST_CSOSN_S     write FCST_CSOSN_S    ;
  property CST_ICMS_E      : String           read FCST_ICMS_E      write FCST_ICMS_E     ;
  property CST_ICMS_S      : String           read FCST_ICMS_S      write FCST_ICMS_S     ;
  property CST_IPI         : String           read FCST_IPI         write FCST_IPI        ;
  property DESCRICAO       : String           read FDESCRICAO       write FDESCRICAO      ;
  property ENQ_IPI         : String           read FENQ_IPI         write FENQ_IPI        ;
  property FEM_ICMS        : String           read FFEM_ICMS        write FFEM_ICMS       ;
  property LISTA           : String           read FLISTA           write FLISTA          ;
  property MOD_BC          : String           read FMOD_BC          write FMOD_BC         ;
  property MOT_DES         : String           read FMOT_DES         write FMOT_DES        ;
  property MVA             : String           read FMVA             write FMVA            ;
  property NATRECEITA      : String           read FNATRECEITA      write FNATRECEITA     ;
  property PMvast          : String           read FPMvast          write FPMvast         ;
  property TIP_MED         : String           read FTIP_MED         write FTIP_MED        ;
  property TP_ALIQICMS     : String           read FTP_ALIQICMS     write FTP_ALIQICMS    ;
  property pICMSST         : String           read FPICMSST         write FPICMSST        ;
  property pRED_ALIQICMS   : String           read FPRED_ALIQICMS   write FPRED_ALIQICMS  ;
end;

type
  TDTConsultValid = class(TComponent)
  private
    FCNPJ: string;
    FRegime: TpvRegimeTributario;
    FGravaLog: Boolean;
    FUF: string;
    FCodFaixa: string;
    FToken: string;
    FSenha: string;
    FAmbiente: TAmbiente;
    FTipoArquivo: Tarquivo;
    FCaminhoLog: string;
    FLogin: string;
    FRetorno: Tretorno;
    procedure setAmbiente(const Value: TAmbiente);
    procedure setCaminhoLog(const Value: string);
    procedure setCNPJ(const Value: string);
    procedure setCodfaixa(const Value: string);
    procedure setGravaLog(const Value: Boolean);
    procedure setLogin(const Value: string);
    procedure setRegime(const Value: TpvRegimeTributario);
    procedure setSenha(const Value: string);
    procedure SetTipoArquivo(const Value: Tarquivo);
    procedure SetToken(const Value: string);
    procedure setUF(const Value: string);
    procedure SetRetorno(const Value: Tretorno);

    procedure JsonEnvioRecebimento(Tipo:Integer; JSON: string);

  protected

  public
    RetAjustados : TList<TAjustados>;
    RetErros : TList<TErros>;
    RetResumo : TList<TResumo>;
    function GetToken:string;
    function ConsultaTributos( aLista : TStringList ) : Tretorno;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  published
    property CNPJ:string                          read FCNPJ        write setCNPJ;
    property UF:string                            read FUF          write setUF;
    property Login:string                         read FLogin       write setLogin;
    property Senha:string                         read FSenha       write setSenha;
    property Ambiente:TAmbiente                   read FAmbiente    write setAmbiente;
    property RegimeTributario:TpvRegimeTributario read FRegime      write setRegime;
    property CodFaixa:string                      read FCodFaixa    write setCodfaixa;
    property GravaLog:Boolean                     read FGravaLog    write setGravaLog;
    property CaminhoLog:string                    read FCaminhoLog  write setCaminhoLog;
    property Token : string                       read FToken       write SetToken;
    property TipoArquivo : Tarquivo               read FTipoArquivo write SetTipoArquivo;
    property Retorno : Tretorno                   read FRetorno     write SetRetorno;

  end;

procedure Register;

implementation

uses
  System.Net.URLClient;

procedure Register;
begin
  RegisterComponents('DT Inovacao', [TDTConsultValid]);
end;

{ TDTConsultValid }

function TDTConsultValid.ConsultaTributos(aLista: TStringList): Tretorno;
var
vConst1,vConst3         : string;
ListaProdutos           : string;
Regime                  : string;
Quebra                  : TStringList;
I                       : Integer;
vBody                   : string;
HttpClient              : THttpClient;
Response                : IHttpResponse;
xURL                    : string;
GTIN,CODINTERNO,DESC    : string;
NCM,CEST                : string;
Parametros              : TStringList;
ret                     : TAjustados;
retErr                  : TErros;
retRes                  : TResumo;
Json,ProdObj,CfopObj    : TJSONObject;
Produtos                : TJSONArray;
Erros,Resumo            : TJSONArray;
begin
   GetToken;
   
   case RegimeTributario of
     tpvSimplesNacional : Regime := '"RTRIB":"1"';
     tpvLucroPresumido  : Regime := '"RTRIB":"2"';
     tpvLucroReal       : Regime := '"RTRIB":"3"';
   end;
   ListaProdutos := '';       
         vConst1 := '{"CABECALHO":[{"CNPJ":"'+ FCNPJ +'","UF":"'+FUF+'",'+ Regime +',"DATA":"'+ FormatDateTime('YYYY-MM-DD', Date) +
                    '","HORA":"'+ FormatDateTime('hh:mm:ss', Now) +'","TOKEN":"'+ FToken +'","COD_FAT12M":"'+ FCodFaixa +'","ARQ":"1"}],'+
                    '"PRODUTO":[';

   for I := 0 to Pred( aLista.Count ) do
    begin        
           Quebra := TStringList.Create;
           ExtractStrings(['|'],[ ],Pchar(aLista[i]),Quebra);

           GTIN       := Quebra[0];
           CODINTERNO := Quebra[1];
           DESC       := Quebra[2];

           if i=0 then
           begin
                 ListaProdutos := '{"COD_BARRAS":"'  + GTIN +  '", ' +
                                  ' "COD_INTERNO":"' + CODINTERNO +  '", ' +
                                  ' "DESCRICAO":"'   + DESC +  '" ' +
                                  ' }';
           end else begin
                 ListaProdutos := ListaProdutos + 
                                  ',{"COD_BARRAS":"' + GTIN +  '", ' +
                                  ' "COD_INTERNO":"' + CODINTERNO +  '", ' +
                                  ' "DESCRICAO":"'   + DESC +  '" ' +
                                  ' }';
           end; 
           Quebra.Free; 
    end;   
    vConst3 :=  ']}';  

    vBody   := vConst1 + ListaProdutos + vConst3;   

    try
      HttpClient := THttpClient.Create;
      HttpClient.ContentType := 'application/json';
      HttpClient.Accept      := '/';
      Parametros  := TStringList.Create;
      Parametros.Add('wJSON=' + vBody);
      case FAmbiente of
        tpvHomologacao: xURL := URL_Homologacao;
        tpvProducao:    xURL := URL_Producao;
      end;
      try
        if FGravaLog then
            JsonEnvioRecebimento(1, vBody );

        Response := HttpClient.Post( xURL, Parametros);

        FRetorno.Codigo   := Response.StatusCode;
        FRetorno.Mensagem := UTF8Decode( Response.ContentAsString );

        if Response.StatusCode = 200 then
        begin
              if FGravaLog then
                JsonEnvioRecebimento(2, UTF8Decode( Response.ContentAsString ) );

              RetAjustados.Clear;
              RetErros.Clear;

              Json      := TJSONObject.ParseJSONValue( UTF8Decode( Response.ContentAsString ) ) as TJSONObject;
              Produtos  := Json.GetValue<TJSONArray>('PRODUTO') as TJSONArray;
              Erros     := Json.GetValue<TJSONArray>('ERRO') as TJSONArray;
              Resumo    := Json.GetValue<TJSONArray>('RESUMO') as TJSONArray;

              for I := 0 to Pred( Produtos.Count ) do
              begin
                     ProdObj := Produtos.Items[i] as TJSONObject;

                     ret                := TAjustados.Create;
                     ret.FCSTCOF_S      := ProdObj.Values['CSTCOF_S'].Value;
                     ret.FCST_ICMS_S    := ProdObj.Values['CST_ICMS_S'].Value;
                     ret.FALIQREDICMS   := ProdObj.Values['ALIQREDICMS'].Value;
                     ret.FLISTA         := ProdObj.Values['LISTA'].Value;
                     ret.FAliq_ICMS     := ProdObj.Values['Aliq_ICMS'].Value;
                     ret.FDESCRICAO     := ProdObj.Values['DESCRICAO'].Value;
                     ret.FMVA           := ProdObj.Values['MVA'].Value;
                     ret.FTIP_MED       := ProdObj.Values['TIP_MED'].Value;
                     ret.FNATRECEITA    := ProdObj.Values['NATRECEITA'].Value;
                     ret.FMOT_DES       := ProdObj.Values['MOT_DES'].Value;
                     ret.FCST_IPI       := ProdObj.Values['CST_IPI'].Value;
                     ret.FCOD_BARRAS    := ProdObj.Values['COD_BARRAS'].Value;
                     ret.FCFOP          := ProdObj.GetValue<String>('CFOP[0].OP_INTERNO[0].CFOP_SI');
                     ret.FPRED_ALIQICMS := ProdObj.Values['pRED_ALIQICMS'].Value;
                     ret.FCSTPIS_E      := ProdObj.Values['CSTPIS_E'].Value;
                     ret.FALIQ_PIS      := ProdObj.Values['ALIQ_PIS'].Value;
                     ret.FALIQ_COFINS   := ProdObj.Values['ALIQ_COFINS'].Value;
                     ret.FPICMSST       := ProdObj.Values['pICMSST'].Value;
                     ret.FCSTCOF_E      := ProdObj.Values['CSTCOF_E'].Value;
                     ret.FCOD_CEST      := ProdObj.Values['COD_CEST'].Value;
                     ret.FPMvast        := ProdObj.Values['PMvast'].Value;
                     ret.FMOD_BC        := ProdObj.Values['MOD_BC'].Value;
                     ret.FALIQ_DESICMS  := ProdObj.Values['ALIQ_DESICMS'].Value;
                     ret.FFEM_ICMS      := ProdObj.Values['FEM_ICMS'].Value;
                     ret.FCST_ICMS_E    := ProdObj.Values['CST_ICMS_E'].Value;
                     ret.FCOD_INTERNO   := ProdObj.Values['COD_INTERNO'].Value;
                     ret.FENQ_IPI       := ProdObj.Values['ENQ_IPI'].Value;
                     ret.FCST_CSOSN_S   := ProdObj.Values['CST_CSOSN_S'].Value;
                     ret.FAliq_IPI      := ProdObj.Values['Aliq_IPI'].Value;
                     ret.FTP_ALIQICMS   := ProdObj.Values['TP_ALIQICMS'].Value;
                     ret.FCOD_NCM       := ProdObj.Values['COD_NCM'].Value;
                     ret.FCOD_BENEF     := ProdObj.Values['COD_BENEF'].Value;
                     ret.FCSTPIS_S      := ProdObj.Values['CSTPIS_S'].Value;

                     RetAjustados.Add( ret );
              end;

              for I := 0 to Pred( Erros.Count ) do
              begin
                   ProdObj := Erros.Items[i] as TJSONObject;

                   retErr := TErros.Create;
                   retErr.COD_INTERNO := ProdObj.Values['COD_INTERNO'].Value;
                   retErr.DESCRICAO   := ProdObj.Values['DESCRICAO'].Value;
                   retErr.MSGERR      := ProdObj.Values['MSGERR'].Value;

                   RetErros.Add( retErr );
              end;

              for I := 0 to Pred( Resumo.Count ) do
              begin
                   ProdObj := Resumo.Items[i] as TJSONObject;

                   retRes := TResumo.Create;
                   retRes.TOTAL          := ProdObj.Values['TOTAL'].Value;
                   retRes.CERTOS         := ProdObj.Values['CERTOS'].Value;
                   retRes.AJUSTADO       := ProdObj.Values['AJUSTADO'].Value;
                   retRes.ANALISECLIENTE := ProdObj.Values['ANALISECLIENTE'].Value;
                   retRes.ANALISECONSULT := ProdObj.Values['ANALISECONSULT'].Value;

                   RetResumo.Add( retRes );
              end;

        end else begin
           raise Exception.Create(Response.StatusCode.ToString + ' ' + Response.StatusText + ' ' + Response.ContentAsString);
        end;

      except
        on E:Exception do
        begin  
           raise Exception.Create(E.Message);
        end;
      end;
    finally
      if Assigned(Parametros) then
        FreeAndNil(Parametros);
      if Assigned(HttpClient) then
        FreeAndNil(HttpClient);
    end;   

end;

constructor TDTConsultValid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  RetAjustados := TList<TAjustados>.Create;
  RetErros     := TList<TErros>.Create;
  RetResumo    := TList<TResumo>.Create;

end;

destructor TDTConsultValid.Destroy;
begin
  RetAjustados.Clear;
  RetErros.Clear;

  FreeAndNil(RetAjustados);
  FreeAndNil(RetErros);
  FreeAndNil(RetResumo);

  inherited Destroy;
end;

function TDTConsultValid.GetToken: string;
var
  HttpClient  : THttpClient;
  Response    : IHttpResponse;
  RequestBody : TStringStream;
  Parametros  : TStringList;
  xURL        : string;
begin
    try
      HttpClient := THttpClient.Create;
      HttpClient.ContentType := 'application/json';
      HttpClient.Accept      := '/';
      RequestBody := TStringStream.Create('');
      Parametros := TStringList.Create;
      Parametros.Add('wUsuario=' + FLogin);
      Parametros.Add('wSenna=' + FSenha);
      case FAmbiente of
        tpvHomologacao: xURL := URL_Homologacao;
        tpvProducao:    xURL := URL_Producao;
      end;
      try
        Response := HttpClient.Post( xURL, Parametros);

        FRetorno.Codigo   := Response.StatusCode;
        FRetorno.Mensagem := Response.ContentAsString; 
        FToken            := Response.ContentAsString; 
        Result            := Response.ContentAsString;  
      except
        on E:Exception do
        begin  
           Result := e.Message;
           raise Exception.Create(E.Message);
        end;
      end;
      if Response.StatusCode <> 200 then
      begin
         Result := Response.StatusCode.ToString + ' ' + Response.StatusText + ' ' + Response.ContentAsString;
         raise Exception.Create(Response.StatusCode.ToString + ' ' + Response.StatusText + ' ' + Response.ContentAsString);
      end;
    finally
      if Assigned(Parametros) then
        FreeAndNil(Parametros);
      if Assigned(RequestBody) then
        FreeAndNil(RequestBody);
      if Assigned(HttpClient) then
        FreeAndNil(HttpClient);
    end;
end;

procedure TDTConsultValid.JsonEnvioRecebimento(Tipo: Integer; JSON: string);
var
  NomeArquivo: string;
  Arquivo: TextFile;
begin
    try
        try
           if GravaLog then
           begin
                if CaminhoLog<>'' then
                begin
                    if not DirectoryExists(FCaminhoLog) then
                        ForceDirectories(FCaminhoLog);

                    if Tipo = 1 then
                      NomeArquivo := ChangeFileExt(FCaminhoLog, '\JsonEnviado_'  + FormatDateTime('DD_MM_YYYYhhmmss',Now)+'.json')
                    else
                      NomeArquivo := ChangeFileExt(FCaminhoLog, '\JsonRecebido_' + FormatDateTime('DD_MM_YYYYhhmmss',Now)+'.json');

                    AssignFile(Arquivo, NomeArquivo);
                    if FileExists(NomeArquivo) then
                      Append(arquivo)
                    else
                      ReWrite(arquivo);

                    try
                      WriteLn(arquivo, JSON );
                    finally
                      CloseFile(arquivo);
                    end;

                end;
           end;
        except
        end;
    finally
    end;
end;

procedure TDTConsultValid.setAmbiente(const Value: TAmbiente);
begin
  FAmbiente := Value;
end;

procedure TDTConsultValid.setCaminhoLog(const Value: string);
begin
  FCaminhoLog := Value;
end;

procedure TDTConsultValid.setCNPJ(const Value: string);
begin
  FCNPJ := Value;
end;

procedure TDTConsultValid.setCodfaixa(const Value: string);
begin
  FCodFaixa := Value;
end;

procedure TDTConsultValid.setGravaLog(const Value: Boolean);
begin
  FGravaLog := Value;
end;

procedure TDTConsultValid.setLogin(const Value: string);
begin
  FLogin := Value;
end;

procedure TDTConsultValid.setRegime(const Value: TpvRegimeTributario);
begin
  FRegime := Value;
end;

procedure TDTConsultValid.SetRetorno(const Value: Tretorno);
begin
  FRetorno := Value;
end;

procedure TDTConsultValid.setSenha(const Value: string);
begin
  FSenha := Value;
end;

procedure TDTConsultValid.SetTipoArquivo(const Value: Tarquivo);
begin
  FTipoArquivo := Value;
end;

procedure TDTConsultValid.SetToken(const Value: string);
begin
  FToken := Value;
end;

procedure TDTConsultValid.setUF(const Value: string);
begin
  FUF := Value;
end;

end.
