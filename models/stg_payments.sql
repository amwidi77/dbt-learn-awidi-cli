select orderid,
    paymentmethod,
    status,
    amount / 100 as amount
from raw.stripe.payment