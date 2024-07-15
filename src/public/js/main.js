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

    $(document).ready(function () {
        $('.review-rating').each(function () {
            var rating = $(this).data('rating');
            updateCommentStars($(this), rating);
        });

        function updateCommentStars(commentStars, rating) {
            commentStars.find('.star').each(function (index) {
                if (index < rating) {
                    $(this).addClass('active');
                } else {
                    $(this).removeClass('active');
                }
            });
        }
    });

    $(document).ready(function () {
        $('#product-slider-1').slick({
            slidesToShow: 5,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 2000,
            nextArrow: $('.next-1'),
            prevArrow: $('.prev-1'),
            dots: true,
            responsive: [
                {
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 1,
                        infinite: true,
                        dots: true,
                    },
                },
                {
                    breakpoint: 600,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 1,
                    },
                },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                    },
                },
            ],
        });

        $('#product-slider-2').slick({
            slidesToShow: 5,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 2000,
            nextArrow: $('.next-2'),
            prevArrow: $('.prev-2'),
            dots: true,
            responsive: [
                {
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 1,
                        infinite: true,
                        dots: true,
                    },
                },
                {
                    breakpoint: 600,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 1,
                    },
                },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                    },
                },
            ],
        });

        $('#product-slider-3').slick({
            slidesToShow: 5,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 2000,
            nextArrow: $('.next-3'),
            prevArrow: $('.prev-3'),
            dots: true,
            responsive: [
                {
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 1,
                        infinite: true,
                        dots: true,
                    },
                },
                {
                    breakpoint: 600,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 1,
                    },
                },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                    },
                },
            ],
        });
    });

    // Back to top button
    $(document).ready(function () {
        // Hiển thị hoặc ẩn nút "Back to top" dựa trên vị trí cuộn trang
        $(window).scroll(function () {
            if ($(this).scrollTop() > 100) {
                $('.back-to-top').fadeIn('slow');
            } else {
                $('.back-to-top').fadeOut('slow');
            }
        });

        // Khi nút "Back to top" được nhấn, cuộn lên đầu trang
        $('.back-to-top').click(function (e) {
            e.preventDefault();
            $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        });
    });
})(jQuery);
