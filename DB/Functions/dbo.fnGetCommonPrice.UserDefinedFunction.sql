SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











-- =============================================
-- Author:        Bala
-- Create date: March 15,2010
-- Description: Gets the given currency value from exchannge rates
-- =============================================
CREATE FUNCTION [dbo].[fnGetCommonPrice] 
(
	@strCurId nvarchar(10),
    @mnyPrice money
)
RETURNS money
AS
BEGIN
	
	--select @mnyPrice = 0
	/*
	declare @mnyPrice money
	declare @strCurId nvarchar(10)
	set @mnyPrice = 450
	set @strCurId = 'EUR'
	*/

	select @mnyPrice = @mnyPrice / CurrencyValue from Currency where CurrencyID = @strCurId
	return @mnyPrice
END










GO
