<student-item>
    <div class="studentItem_name">name : { studentName }</div>
    <div class="subscribe_list">
        <div class="course_list_drop { hidden : openFlag }" onclick="{ selectCourse }">course_list</div>
        <div class="course_list_contents { show : openFlag }">
            <div each="{ courseData, i in opts.courseData }" onclick="{ subscribe.bind(this, parent.opts.studentData, courseData) }">
                { courseData.name }
            </div>
        </div>
    </div>
    <virtual if="{ studentCourseData.length > 0 }">
        <div class="student_list">
            <div each="{ course, i in studentCourseData }" onclick="{ unsubscribe.bind(this, opts.studentData, course) }">{ course.name }</div>
        </div>
    </virtual>

    <style scoped>
        :scope {
            display: block;
            background-color: #ccc;
            flex: 1 1 32%;
            max-width: 32%;
            margin: 3px;
        }

        .studentItem_name {
            padding: 5px;
            background-color: #cddc39;
        }

        .subscribe_list {
            display: block;
            text-align: right;
            position: relative;
        }

        .course_list_drop {
            position: absolute;
            right: 0;
        }

        .course_list_drop.hidden {
            display: none;
        }

        .course_list_contents {
            display: none;
            position: absolute;
            right: 0;
            text-align: center;
        }

        .course_list_contents.show {
            display: block;
        }

        .student_list {
            display: flex;
            flex-direction: column;
            justify-content: center;
            text-align: center;
            font-size: 15px;
            margin: 20px 10px;
        }
    </style>

    <script>
        import Subject from '../../modules/Subject'
        import Observer from '../../modules/Observer'

        this.openFlag = false;

        this.on('before-mount', () => {
            // mixin action
            this.mixin('action');

            this.studentName = this.opts.studentData.name;
            this.studentCourseData = this.opts.studentData.subjects;
        })

        // student subscribe
        this.subscribe = (student,course) => {
            this.studentCourseData = student.subscribe(course).subjects;
            this.action.trigger('student-subscribe', student,course);
            this.openFlag = false;
        }

        // student unsubscribe
        this.unsubscribe = (student,course) => {
            // method 1 : update component is this child tag
            // but when it affects other child component data, need to update other child component
            this.studentCourseData = student.unSubscribe(course).subjects;
            this.action.trigger('student-unsubscribe', student,course);

            // @TODO method 2: pass param to root tag(course tag), trigger root tag update
            // advantage of method 2 is no need to update other component
            //this.action.trigger('unsubscribe', student, course);
        }

        //
        this.selectCourse = () => {
            this.openFlag = true;
        }
    </script>
</student-item>