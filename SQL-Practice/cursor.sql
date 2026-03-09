use Sales;

select * from customer where cust_id = 3;

select * from customer where cust_addr = 'Chennai';

DECLARE @MyCursor CURSOR;
DECLARE @myamt decimal(7,2);
Declare @total decimal(10,2);

BEGIN
    SET @MyCursor = CURSOR FOR
    select amount from orders
   
    set @total = 0;       

    OPEN @MyCursor 
    FETCH NEXT FROM @MyCursor INTO @myamt

    WHILE @@FETCH_STATUS = 0
    BEGIN
      
      set @total = @total + @myamt
      select @total as running_total;
      FETCH NEXT FROM @MyCursor INTO @myamt
    END; 

    Select @total as total_sales;	

    CLOSE @MyCursor ;
    DEALLOCATE @MyCursor;
END;