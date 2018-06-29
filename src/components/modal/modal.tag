<modal>
    <dialog class="dialog">
        <div>input name</div>
        <input ref="input" type="text"></input>
        <div onclick="{ close }">close</div>
        <div onclick="{ add.bind(null, this.addType) }">add</div>
    </dialog>

    <style>
        :scope {
            display: block;
        }
    </style>

    <script>
        // init type of open modal
        this.addType = 'course';

        this.on('before-mount', () => {
            // mixin action
            this.mixin('action');

            // listen open modal event
            this.action.on('openModal', (type) => {
                this.openModal(type);
            })
        });

        // according to type, open modal dialog
        this.openModal = (type) => {
            // reset type of open modal
            if(type == 'addStudent') {
                this.addType = 'student';
            } else {
                this.addType = 'course';
            }
            this.update();
            let dialog = document.querySelector('.dialog');
            dialog.showModal();
        };

        // close dialog
        this.close = () => {
            let dialog = document.querySelector('.dialog');
            dialog.close();
        }

        // click add event ,then trigger add student or course
        this.add = (type) => {
            let category = this.refs.input.value;
            if(type === 'student') {
                this.action.trigger('addStudent', category);
            } else {
                this.action.trigger('addCourse', category);
            }
            // close dialog
            this.close();
        }
    </script>
</modal>