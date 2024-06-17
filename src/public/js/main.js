// const $ = document.querySelector.bind(document);
// const $$ = document.querySelectorAll.bind(document);

// // Input Number Quantity
// const up = $('.qty-up');
// const down = $('.qty-down');
// const num = $('.input-number input');

// let a = 1;

// up.addEventListener('click', () => {
//     num.value = parseInt(num.value) + 1;
// });

// down.addEventListener('click', () => {
//     if (parseInt(num.value) > parseInt(num.min)) {
//         num.value = parseInt(num.value) - 1;
//     }
// });Price Range Slider

//
// const rangeInput = $$('.range-input input'),
//     priceInput = $$('.price-input input'),
//     range = $('.slider .progress');
// let priceGap = 10000;

// priceInput.forEach((input) => {
//     input.addEventListener('input', (e) => {
//         let minPrice = parseInt(priceInput[0].value),
//             maxPrice = parseInt(priceInput[1].value);

//         if (maxPrice - minPrice >= priceGap && maxPrice <= rangeInput[1].max) {
//             if (e.target.className === 'input-min') {
//                 rangeInput[0].value = minPrice;
//                 range.style.left = (minPrice / rangeInput[0].max) * 100 + '%';
//             } else {
//                 rangeInput[1].value = maxPrice;
//                 range.style.right = 100 - (maxPrice / rangeInput[1].max) * 100 + '%';
//             }
//         }
//     });
// });

// rangeInput.forEach((input) => {
//     input.addEventListener('input', (e) => {
//         let minVal = parseInt(rangeInput[0].value),
//             maxVal = parseInt(rangeInput[1].value);

//         if (maxVal - minVal < priceGap) {
//             if (e.target.className === 'range-min') {
//                 rangeInput[0].value = maxVal - priceGap;
//             } else {
//                 rangeInput[1].value = minVal + priceGap;
//             }
//         } else {
//             priceInput[0].value = minVal;
//             priceInput[1].value = maxVal;
//             range.style.left = (minVal / rangeInput[0].max) * 100 + '%';
//             range.style.right = 100 - (maxVal / rangeInput[1].max) * 100 + '%';
//         }
//     });
// });

(function ($) {
    'use strict';

    // product/product-by-type
    // Price Range Slider
    $(document).ready(function () {
        const rangeInput = $('.range-input input'),
            priceInput = $('.price-input input'),
            range = $('.slider .progress');
        let priceGap = 10000;

        priceInput.each(function () {
            $(this).on('input', function (e) {
                let minPrice = parseInt(priceInput.eq(0).val()),
                    maxPrice = parseInt(priceInput.eq(1).val());

                if (maxPrice - minPrice >= priceGap && maxPrice <= rangeInput.eq(1).attr('max')) {
                    if ($(e.target).hasClass('input-min')) {
                        rangeInput.eq(0).val(minPrice);
                        range.css('left', (minPrice / rangeInput.eq(0).attr('max')) * 100 + '%');
                    } else {
                        rangeInput.eq(1).val(maxPrice);
                        range.css('right', 100 - (maxPrice / rangeInput.eq(1).attr('max')) * 100 + '%');
                    }
                }
            });
        });

        rangeInput.each(function () {
            $(this).on('input', function (e) {
                let minVal = parseInt(rangeInput.eq(0).val()),
                    maxVal = parseInt(rangeInput.eq(1).val());

                if (maxVal - minVal < priceGap) {
                    if ($(e.target).hasClass('range-min')) {
                        rangeInput.eq(0).val(maxVal - priceGap);
                    } else {
                        rangeInput.eq(1).val(minVal + priceGap);
                    }
                } else {
                    priceInput.eq(0).val(minVal);
                    priceInput.eq(1).val(maxVal);
                    range.css('left', (minVal / rangeInput.eq(0).attr('max')) * 100 + '%');
                    range.css('right', 100 - (maxVal / rangeInput.eq(1).attr('max')) * 100 + '%');
                }
            });
        });
    });

    // product/product-details
    // Input Number Quantity
    // $(document).ready(function () {
    //     const num = $('.input-number input');
    //     $('.qty-up').on('click', () => {
    //         num.val(parseInt(num.val()) + 1);
    //     });

    //     $('.qty-down').on('click', () => {
    //         num.val(parseInt(num.val()) - 1);
    //     });
    // });
    $(document).ready(function () {
        $('.qty-up').on('click', function () {
            const input = $(this).closest('.input-number').find('input');
            input.val(parseInt(input.val()) + 1);
        });

        $('.qty-down').on('click', function () {
            const input = $(this).closest('.input-number').find('input');
            const currentValue = parseInt(input.val());
            if (currentValue > 0) {
                input.val(currentValue - 1);
            }
        });
    });

    $(document).ready(function () {
        function updateTotalPrice() {
            var totalProductPrice = 0;

            $('.select:checked').each(function () {
                var row = $(this).closest('tr');
                var price = parseFloat(row.find('.price').text());
                var quantity = parseInt(row.find('input[name="quantity"]').val());
                var total = price * quantity;

                totalProductPrice += total;
            });

            $('.cart-content p .total-product-price').text(totalProductPrice.toLocaleString());

            // var shippingFee = parseFloat($('.cart-content p .shipping-fee').text());
            // var totalAmount = totalProductPrice + shippingFee;
            var totalAmount = totalProductPrice;
            $('.cart-content h2 span').text(totalAmount.toLocaleString());
        }

        updateTotalPrice();

        $('.select').change(function () {
            updateTotalPrice();

            var row = $(this).closest('tr');
            var productID = row.find('.product-id').text();
            console.log('productID:', productID);
            var form = $('form');

            if ($(this).is(':checked')) {
                form.append(`<input type='hidden' name='productID' value='${productID}' class='hidden-product-id-${productID}' />`);
            } else {
                form.find(`.hidden-product-id-${productID}`).remove();
            }
        });
    });
})(jQuery);
