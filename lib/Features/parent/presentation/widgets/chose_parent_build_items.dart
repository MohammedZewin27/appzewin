
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/widgets/custom_progress_indicator.dart';
import '../../data/models/parent_model.dart';
import '../cubit/parent_cubit.dart';
import 'choose_parent_body.dart';

class ChoseParentBuildItems extends StatelessWidget {
  const ChoseParentBuildItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParentCubit, ParentState>(
      builder: (context, state) {
        if (state is ParentSuccess) {
          List<DataParent> parentData = state.parentModel.dataParent ?? [];
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: parentData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: .7),
            itemBuilder: (context, index) {
              return ChooseParentItems(parentData: parentData[index]);
            },
          );
        } else {
          return Center(
            child: RefreshIndicator(
              onRefresh: () {
                return ParentCubit.get(context).fetchParent();
              },
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: ListView(children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 1.8,
                    child: const CustomProgressIndicator(),
                  ),
                ]),
              ),
            ),
          );
        }
      },
    );
  }
}