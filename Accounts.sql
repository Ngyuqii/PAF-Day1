/*Conditional Update
-- Create a table with last_update timestamp (last_update timestamp on update current_timestamp)
create table accounts (
acct_id varchar(8) not null,
balance decimal(10,2),
last_update timestamp on update current_timestamp,
primary key(acct_id)
);

-- Add column in existing table
ALTER TABLE accounts ADD COLUMN new_update timestamp;

-- Add current timestamp during insert
insert into accounts (acct_id, balance, last_update) values ('4', '100.0', current_timestamp());

-- Set the old balance and last update time to variables
SELECT @old_balance := balance,
@last_update := last_update
FROM accounts
WHERE acct_id = '1';

-- Update the account balance only if the old balance and last update time match
UPDATE accounts
SET balance = @old_balance + 20, last_update = NOW()
WHERE acct_id = '1' AND balance = @old_balance AND last_update = @last_update;

-- Transaction, dont really see the use of it yet since the codes run line by line anyway
start transaction;
set @fromAcct = 1, @toAcct = 2, @amount = 10;
update accounts set balance = balance - @amount where acct_id = @from_acct;
update accounts set balance = balance + @amount where acct_id = @to_acct;
commit;

select * from accounts;
*/