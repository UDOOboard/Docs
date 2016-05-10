Pulse Width Modulation is a modulation technique where a digital pin alternates high and low. It is possible to configure the period (how frequent should the output oscillate) and the duty cycly (how much should the output stay high).

PWM signals can be used to:

 * control LEDs brightness
 * control colors on RGB LEDs
 * control motors, like servos
 * etc.
 

### Step 1: enable PWM outputs

Enable the PWM features on the external pinout using the [device tree editor](../Cookbook_Linux/Device_Tree_Editor.html).


### Step 2: configure the outputs

Before configuring a PWM output, it is necessary to export it:

    echo 0 > /sys/class/pwm/pwmchip0/export

Then set period and duty cycle. For example, to generate a 1kHz signal with 30% of duty cycle, use:

    echo 1000000 > /sys/class/pwm/pwmchip0/pwm0/period
    echo  300000 > /sys/class/pwm/pwmchip0/pwm0/duty_cycle

Then enable the PWM output:

    echo 1 > /sys/class/pwm/pwmchip0/pwm0/enable


### Possible values to be used

`period` - The total period of the PWM signal (read/write). Value is in **nanoseconds** and is the **sum** of the active and inactive time of the PWM.

`duty_cycle` - The **active time** of the PWM signal (read/write). Value is in nanoseconds and must be less than the period.

`enable` - Enable/disable the PWM signal (read/write); `0` means disabled


### PWM settings generator

Select the desired frequency and duty cycle:


<link rel="stylesheet" href="../themes/daux/css/slider.css">
<script>
navigator.sayswho = (function(){
    var ua= navigator.userAgent, tem, 
    M= ua.match(/(opera|chrome|safari|firefox|msie|trident(?=\/))\/?\s*(\d+)/i) || [];
    if(/trident/i.test(M[1])){
        tem=  /\brv[ :]+(\d+)/g.exec(ua) || [];
        return 'IE '+(tem[1] || '');
    }
    if(M[1]=== 'Chrome'){
        tem= ua.match(/\bOPR\/(\d+)/)
        if(tem!= null) return 'Opera '+tem[1];
    }
    M= M[2]? [M[1], M[2]]: [navigator.appName, navigator.appVersion, '-?'];
    if((tem= ua.match(/version\/(\d+)/i))!= null) M.splice(1, 1, tem[1]);
    return M[0];
})();
var browser = navigator.sayswho.toLowerCase();
function nFormatter(num, digits) {
    var si = [
      { value: 1E18, symbol: "E" },
      { value: 1E15, symbol: "P" },
      { value: 1E12, symbol: "T" },
      { value: 1E9,  symbol: "G" },
      { value: 1E6,  symbol: "M" },
      { value: 1E3,  symbol: "k" }
    ], i;
    for (i = 0; i < si.length; i++) {
      if (num >= si[i].value) {
        return (num / si[i].value).toFixed(digits).replace(/\.0+$|(\.[0-9]*[1-9])0+$/, "$1") + si[i].symbol;
      }
    }
    return num.toString();
}
function onHzChange() {
    var showValue = nFormatter(parseInt($("input[type=range][data-type=hz]").val()), 3) + "Hz";
    $(".indicator[data-type=hz]").html(showValue);
    updateCode();
}
function onPcChange() {
    var showValue = parseInt($("input[type=range][data-type=pc]").val()) + "%";
    $(".indicator[data-type=pc]").html(showValue);
    updateCode();
}
function updateCode() {
    var period = Math.round(1000000000/parseInt($("input[type=range][data-type=hz]").val()));
    var duty = Math.round(period*parseInt($("input[type=range][data-type=pc]").val())/100);
    $(".pwm-generated .hljs-number").first().html(period);
    $(".pwm-generated .hljs-number").last().html(duty);
}
$(window).load(function(){
	$('body').addClass(browser);
    $("input[type=range][data-type=hz]").on("change mousemove", onHzChange);
    $("input[type=range][data-type=pc]").on("change mousemove", onPcChange);
    setTimeout(function(){ 
        onHzChange();
        onPcChange();
    }, 100);
});
</script>


##### PWM frequency

<div>
    <input type="range" data-type="hz" min="1" max="100000" value="1000" step="1"> <span class="indicator" data-type="hz"></span>
</div>

##### Duty cicle

<div>
    <input type="range" data-type="pc" min="1" max="100" value="30" step="1"> <span class="indicator" data-type="pc"></span>
</div>

##### Generated code

<div class="pwm-generated">

    echo 123456789 > /sys/class/pwm/pwmchip0/pwm0/period
    echo 987654321 > /sys/class/pwm/pwmchip0/pwm0/duty_cycle

</div>

