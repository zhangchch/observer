<students-list>
    <div class="student_title">
        <div>students list</div>
        <div onclick="{ addStudent }">add student</div>
    </div>
    <div if="{ opts.studentsList }" class="students_list">
        <virtual each="{ studentsData, index in opts.studentsList }">
            <student-item student-data="{ studentsData }" student-index="{ index }" course-data="{ parent.opts.courseList }"></student-item>
        </virtual>
    </div>

    <style scoped>
        :scope {
            display: block;
        }

        .student_title {
            display: flex;
            justify-content: space-around;
            text-align: center;
            font-size: 15px;
            margin: 10px;
        }

        .students_list {
            display: flex;
            justify-content: flex-start;
            flex-wrap: wrap;
            padding: 10px 20px;
        }
    </style>

    <script>
        this.on('before-mount', () => {
            console.log(this.opts);
            // mixin action
            this.mixin('action');
        })
        this.addStudent = () => {
            this.action.trigger('openModal', 'addStudent');
        }
    </script>
</students-list>