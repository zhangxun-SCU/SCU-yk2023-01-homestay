function throttle(fn, interval, option={
    leading: true,  /* 第一次是否执行 */
    trailing: false  /* 最后依次是否执行 */
}) {

    const {leading, trailing} = option;
    let lastTime = 0; /* 上次触发时间 */
    // let timer = null;
    return function (...args) {
        return new Promise((resolve, reject) => {
            const nowTime = new Date().getTime();
            if(!lastTime && !leading) lastTime = nowTime;  /* 第一次是否执行 */
            const remainTime = interval - (nowTime - lastTime);
            if(remainTime <= 0) {
                // if(timer) {
                //     clearTimeout(timer);
                //     timer = null;
                // }
                resolve(fn.apply(fn, args));
                lastTime = nowTime;
                // return;
            }

            // if(trailing && !timer) {
            //     timer = setTimeout(() => {
            //         lastTime = !leading ? 0: new Date().getTime();
            //         resolve(fn.apply(fn, args));
            //     }, remainTime);
            // }
        })
    }
}