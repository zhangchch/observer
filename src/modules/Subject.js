class ObserverList {
    constructor() {
        this.observerList = [];
    }
    addObserver(observer) {
        this.observerList.push(observer);
    }

    removeObserver(observer) {
        this.observerList = this.observerList.filter((currentVal) => {
            return currentVal != observer
        });
        return this.observerList;
    }
}

class Subject {
    constructor(subjectName) {
        this.name = subjectName;
        this.observers = new ObserverList();
    }

    add(observer) {
        this.observers.addObserver(observer);
    }

    remove(observer) {
        this.observers.removeObserver(observer);
    }

    notify() {
        let message = 'message come from ' + this.name;
        return message;
    }
}

export default Subject