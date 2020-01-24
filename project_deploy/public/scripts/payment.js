(function () {
    // Switch out the test key here with your own
    let stripe = Stripe('pk_test_f7KD4h5hrH0tLRqbb5nnFpIC');
    let paymentRequest = stripe.paymentRequest({
        country: 'US',
        currency: 'usd',
        total: {
            label: 'Demo total',
            amount: 1000,
        }
    });
    
    // Check the availability of the Payment Request API first.
    paymentRequest.canMakePayment().then(function(result) {
        let message = document.getElementById('incompatible-message');
        let button = document.getElementById('payment-request-button');
        if (result) {
            button.style.display = 'inline-block';
            message.style.display = 'none';
            
            // Attach button click to start payment request
            button.addEventListener('click', paymentRequest.show);
            
            // Switch out button with Apple Pay button
            if (result.applePay) {
                button.className = 'btn btn-dark';
                button.style.backgroundColor = '#000';
                button.querySelector('.default').style.display = 'none';
                button.querySelector('.applepay').style.display = 'inline';
            }
        } else {
            button.style.display = 'none';
            message.style.display = 'block';
        }
    });
    
    paymentRequest.on('token', function(ev) {
        document.getElementById('payment-token').innerText = ev.token.id;
        document.getElementById('payment-token-message').style.display = 'block';
        
        // Must call this to finish the payment request
        ev.complete('success');
    });
})();