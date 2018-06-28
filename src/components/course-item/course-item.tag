<course-item>
    <div class="courseItem_category">category : { courseName }</div>
    <virtual if="{ courseStudentList }">
        <div class="student_list">
            <div each="{ student, i in courseStudentList }">{ student.name }</div>
        </div>
    </virtual>

    <style scoped>
        :scope {
            display: block;
            background-color: #ccc;
        }

        .courseItem_category {
            padding: 5px;
            background-color: #cddc39;
        }

        .student_list {
            display: flex;
            flex-direction: column;
            justify-content: center;
            text-align: center;
            font-size: 15px;
            margin: 10px;
        }

        .course_list {
            display: flex;
            justify-content: space-between;
            padding: 10px 20px;
        }
    </style>

    <script>
        this.on('before-mount', () => {
            // mixin action
            this.mixin('action');
            this.courseName = this.opts.courseData.name;
            //@TODO not want to use observers and observerList
            this.courseStudentList = this.opts.courseData.observers.observerList;
            this.action.on('student-unsubscribe', (student,course) => {
                if(this.courseName == course.name) {
                    this.courseStudentList = course.observers.observerList;
                }
                this.update()
            })

            this.action.on('student-subscribe', (student,course) => {
                if(this.courseName == course.name) {
                    this.courseStudentList = course.observers.observerList;
                }
                this.update()
            })
        })
        //this.action.trigger('openModal', () => {
        //    this.openModal();
        //});
//
        //openModal();
//
        //cancel() => {
//
        //}
//
        //add(item) => {
        //    let category = this.tags.input.text();
        //    if(item is course) {
        //        this.action.trigger('addCourse', category);
        //    } else {
        //        this.action.trigger('addStudent', category);
        //    }
        //}
    </script>
</course-item>