<coursePage>
    <div class="title">
        <div>oberser module(subject - observer)</div>
        <div>target: {courseSum} / subscribe: {studentSum}</div>
    </div>

    <course-list course-list="{ courseList }" students-list="{ studentsList }"></course-list>
    <students-list course-list="{ courseList }" students-list="{ studentsList }"></students-list>

    <modal></modal>

    <style scoped>
        :scope {
            display: block;
        }
        .title {
            text-align: center;
            font-size: 20px;
            font-weight: 700;
            margin: 20px;
        }
    </style>

    <script>
        import Subject from '../../modules/Subject'
        import Observer from '../../modules/Observer'

        this.on('before-mount', () => {
            // mixin action
            this.mixin('action');

            this.courseList = [new Subject('html'), new Subject('css'), new Subject('javascript')];
            let student1 = new Observer('lucy');
            student1.subscribe(this.courseList[0]).subscribe(this.courseList[1]);

            let student2 = new Observer('john');
            student2.subscribe(this.courseList[1]).subscribe(this.courseList[2]);

            let student3 = new Observer('jack');
            student3.subscribe(this.courseList[2]);

            this.studentsList = [student1, student2, student3];

            this.courseSum = this.courseList.length;
            this.studentSum = this.studentsList.length;

            this.action.on('unsubscribe', (student, course) => {
                this.unsubscribe(student, course);
            })

            this.action.on('addCourse', (category) => {
                this.courseList.push(new Subject(category));
                this.courseSum = this.courseList.length;
                this.studentSum = this.studentsList.length;
                console.log(this.courseList);
                this.update();
            })

            this.action.on('addStudent', (category) => {
                this.studentsList.push(new Observer(category));
                this.courseSum = this.courseList.length;
                this.studentSum = this.studentsList.length;
                this.update();
            })
        })

        // @TODO riotjs act like not work when deep compare
        // @TODO can not update object deeply
        //this.unsubscribe = (student, course) => {
        //    let studentTempList = [];
        //    let changedStudent = student.unSubscribe(course);
        //    this.studentsList.forEach((currentStudent, index) => {
        //        studentTempList[index] = currentStudent;
        //        if(currentStudent.name == changedStudent.name) {
        //            studentTempList[index] = changedStudent;
        //        }
        //    });
        //    this.courseList.forEach((currentCourse, index) => {
        //        if(currentCourse.name == course.name) {
        //            this.courseList[index] = course;
        //        }
        //    });
        //    this.update(); // update not work
        //    console.log(this.studentsList);
        //}
    </script>
</coursePage>