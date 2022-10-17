select * from {{ ref('newmodel') }}
where c_acctbal > 100000000