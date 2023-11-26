function debounce(fn, delay, immediate=false) {
    let timer = null;
    let isInvoke = false;  /* 是否激活立即执行 */
    const _debounce = function (...args){
        return new Promise((resolve, reject) => {
            if(timer) clearTimeout(timer);  /* 取消上一次的定时器 */
            if(immediate && !isInvoke) {
                isInvoke = true;
                resolve(fn.apply(this, args))
            } else {
                timer = setTimeout(() => {
                    resolve(fn.apply(this, args));
                    isInvoke = false;  /* 恢复立即执行 */
                }, delay);  /* 延迟执行 */
            }
        })
    }

    _debounce.cancel = function () {  /* 增加取消 */
        if(timer) clearTimeout(timer);
        timer = null;
        isInvoke = false;
    }

    return _debounce;
}