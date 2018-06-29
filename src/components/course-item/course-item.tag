<course-item>
    <div class="courseItem_category">category : { courseName }</div>
    <div class="courseItem_publish" onclick="{ publish }">publish</div>
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

        .courseItem_publish {
            text-align: right;
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

            // set courseName and courseStudentList
            this.courseName = this.opts.courseData.name;
            //@TODO not want to use observers and observerList
            this.courseStudentList = this.opts.courseData.observers.observerList;

            // listen student unsbuscribe a course event
            this.action.on('student-unsubscribe', (student,course) => {
                if(this.courseName == course.name) {
                    this.courseStudentList = course.observers.observerList;
                }
                this.update()
            })

            // listen student sbuscribe a course event
            this.action.on('student-subscribe', (student,course) => {
                if(this.courseName == course.name) {
                    this.courseStudentList = course.observers.observerList;
                }
                this.update()
            })
        })

        // this course publish a message to observers
        this.publish = () => {
            let message = this.opts.courseData.notify();
            this.courseStudentList.forEach((student) => {
                this.action.trigger('publish', student, message);
            })
        }
    </script>
</course-item>