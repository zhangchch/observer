<course-list>
    <div class="course_title">
        <div>course list</div>
        <div onclick="{ addCourse }">add course</div>
    </div>
    <div if="{ opts.courseList.length }" class="course_list">
        <virtual each="{ courseData, index in opts.courseList }">
            <course-item course-data="{ courseData }" course-index="{ index }"></course-item>
        </virtual>
    </div>


    <style scoped>
        :scope {
            display: block;
        }

        .course_title {
            display: flex;
            justify-content: space-around;
            text-align: center;
            font-size: 15px;
            margin: 10px;
        }

        .course_list {
            display: flex;
            justify-content: space-around;
            padding: 10px 20px;
        }
    </style>

    <script>
        this.on('before-mount', () => {
            // mixin action
            this.mixin('action');
        })
        this.addCourse = () => {
            this.action.trigger('openModal', 'addCourse');
        }
    </script>
</course-list>