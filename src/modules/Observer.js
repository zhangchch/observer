class Observer {
    constructor(observer) {
        // store course
        this.name = observer;
        this.subjects = [];
        this.subscribe = this.subscribe.bind(this);
        this.unSubscribe = this.unSubscribe.bind(this);
    }

    subscribe(subject) {
        // get all observers of this subject
        const hasSubject = this.subjects.some((currentSubject) => {
            return currentSubject.name == subject.name
        });

        // subject exist or not
        if(!hasSubject) {
            this.subjects.push(subject);
            subject.add(this)
        }

        return this
    }

    unSubscribe(subject) {
        // get all subject of this observer subscribed
        //let subjects = this.subjects;
        this.subjects = this.subjects.filter((currentSubject) => {
            return currentSubject.name != subject.name
        });
        subject.remove(this);
        return this
    }
}

export default Observer