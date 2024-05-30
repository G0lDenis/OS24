#!/bin/bash

let n_need=$1*2
echo $( { echo -n "scale=$1;"; seq 1 2 $n_need | xargs -n1 -I{} echo '(16*(1/5)^{}/{}-4*(1/239)^{}/{})';} | paste -sd-+ | bc -l ) > /dev/null
