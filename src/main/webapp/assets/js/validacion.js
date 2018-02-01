$( document ).ready(function() {
    Parsley.addMessages('es', {
        defaultMessage: "Este valor parece ser inválido.",
        type: {
            email: "Este valor debe ser un correo válido.",
            url: "Este valor debe ser una URL válida.",
            number: "Este valor debe ser un número válido.",
            integer: "Este valor debe ser un número válido.",
            digits: "Este valor debe ser un dígito válido.",
            alphanum: "Este valor debe ser alfanumérico."
        },
        notblank: "Este valor no debe estar en blanco.",
        required: "Este valor es requerido.",
        pattern: "Este valor es incorrecto.",
        min: "Este valor no debe ser menor que %s.",
        max: "Este valor no debe ser mayor que %s.",
        range: "Este valor debe estar entre %s y %s.",
        minlength: "Este valor es muy corto. La longitud mínima es de %s caracteres.",
        maxlength: "Este valor es muy largo. La longitud máxima es de %s caracteres.",
        length: "La longitud de este valor debe estar entre %s y %s caracteres.",
        mincheck: "Debe seleccionar al menos %s opciones.",
        maxcheck: "Debe seleccionar %s opciones o menos.",
        check: "Debe seleccionar entre %s y %s opciones.",
        equalto: "Este valor debe ser idéntico."
    });

    Parsley.setLocale('es');

    Parsley.addValidator('isRut', {
        requirementType: 'string',
        validateString: function (value) {
            rutCompleto = value.replace("‐","-");
            if (!/^[0-9]+[-|‐]{1}[0-9kK]{1}$/.test( rutCompleto )) {
                return false;
            }
            var tmp     = rutCompleto.split('-');
            var digv    = tmp[1];
            var rut     = tmp[0];
            if ( digv == 'K' ) {
                digv = 'k' ;
            }

            function dv(T){
                var M=0,S=1;
                for(;T;T=Math.floor(T/10)) {
                    S=(S+T%10*(9-M++%6))%11;
                }
                return S?S-1:'k';
            }

            return (dv(rut) == digv );
        },
        messages: {
            es: 'El rut no es valido',
        }
    });

    configParsley();

});

function configParsley() {
    var hiddenInputs;
    $.each($('form'), function (key, elem) {
        $(elem).parsley().on('field:validated', function () {
            var ok = $('.parsley-error').length === 0;
            $('.bs-callout-info').toggleClass('hidden', !ok);
            $('.bs-callout-warning').toggleClass('hidden', ok);
            $('.btn-group .parsley-errors-list').insertAfter($('.btn-group .parsley-errors-list').parent());
        }).on('field:validate', function () {

        }).on('form:validate', function () {
            hiddenInputs = $("input[required]:hidden");
            hiddenInputs.removeAttr("required");
        }).on('form:error', function () {
            hiddenInputs.attr("required", "required");
            hiddenInputs = null;
        }).on('form:submit', function () {
        });
    });
}