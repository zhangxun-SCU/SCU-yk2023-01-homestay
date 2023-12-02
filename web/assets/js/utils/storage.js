
class Storage {

    storage;

    constructor(option="localStorage") {
        if(option === 'localStorage') {
            this.storage = localStorage;
        } else if(option === 'sessionStorage') {
            this.storage = sessionStorage;
        }
    }

    set(key, val, expire=null) {
        const data = {
            value: val,
            expire: expire
        };
        this.storage.setItem(key, JSON.stringify(data));
    }

    get(key) {
        const val = this.storage.getItem(key);
        if(val) {
            const data = JSON.parse(val);
            const now = new Date().getTime();
            if( typeof data.expire === "number" && data.expire < now) {
                // 过期
                this.remove(key);
                return null;
            } else {
                return data.value;
            }
        } else {
            return null;
        }
    }

    remove(key) {
        this.storage.removeItem(key);
    }

    clear() {
        this.storage.clear();
    }
}