



CREATE   view [data].[ACCT_Erp_SalesInvoice]
as
select
    [Document No_] = t.Voucher
   ,[Web Order No_] = d.WebshopOrderNo
   ,[Posting Date] = d.PostingDate
   ,[Sell-to Customer No_] = d.CustomerCode
   ,[Bill-to Customer No_] = 'Undersøg behov'                             -- = t.CustomerCode = null
   ,[Line No_] = d.WebShopOrderLineNo                                     -- Kontrolleres
   ,Type                                                                  -- Kontrolleres
   ,No_ = d.ItemNo
   ,[Location Code] = 'Undersøg behov'                                    --= d.LocationCode = null
   ,[Shipment Date] = 'Undersøg behov'                                    --'kan være forskellig fra Date og /eller PostingDate?'
   ,d.Description
   ,[Unit of Measure] = 'Undersøg behov, men er tilsyneladen altid "STK"' -- 'STK'
   ,d.Quantity                                                            -- har omvendt fortegn
   ,d.Amount                                                              -- har omvendt fortegn
   ,[Shortcut Dimension 1 Code] = t.SourceSystemGlobalDimension1Ref
   ,[Shortcut Dimension 2 Code] = t.SourceSystemGlobalDimension2Ref
   ,[Customer Price Group] = 'Undersøg behov'
   ,[Gen_ Prod_ Posting Group] = d.ProductPostingGroup
   ,[Sales Account] = t.AccountNumber
   ,[Order No_] = 'Undersøg behov'
   ,Faktureringsmetode = [Text]                                                                       --,[Order No_] = iif(calc.TextDerivative = 'faktura', 'undersøg behov', null)
   --,Faktureringsmetode = case
   --                          when calc.TextDerivative = 'ordre' then 'Faktura fra salgsordre'
   --                          when calc.TextDerivative = 'faktura' then 'Samle faktura'
   --                          else 'Ukendt'
   --                      end
from
    data.ACCT_Erp_TransactionDetail as d (nolock)
    left join data.ACCT_Erp_Transaction as t (nolock) on
        t.SourceSystemEntryRef = d.SourceSystemTransactionRef
  --  cross apply (select TextDerivative = left(text, charindex(' ', text, 1) - 1)) as calc
where LocationCode='web'
   -- WebshopOrderNo is not null;

GO

